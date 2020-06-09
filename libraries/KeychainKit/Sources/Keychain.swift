//
//  Keychain.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import Security

@dynamicCallable
public struct Keychain {
  /// The kind of data Keychain items hold
  public var itemClass: ItemClass = .genericPassword
  
  //TODO: Budnle identifier by default
  /// The service associated with Keychain item
  public var service: String?
  
  /// Indicates when your app has access to the data in a Keychain item
  public var accessible: AccessibilityLevel
  
  /// Keychain items with share access same group
  public var accessGroup: String?
  
  public var synchronizable: Bool = false
  
  /// Extracted from URL attributes:
  /// * `Server` - the server's domain name or IP address,
  /// * `Path` - the path component of the URL,
  /// * `Port` - thg Internet port number
  ///
  /// Exclusive Internet Password attribuite.
  public var server: URL?
  
  /// Only Internet Password attribuite
  public var protocolType: ProtocolType?
  
  /// Only Internet Password attribuite
  public var authenticationType: AuthenticationType?
  
  /// Only Internet Password attribuite
  public var securityDomain: String?
  
  public var label: String?
  
  public var comment: String?
  
  public var attrDescription: String?
  
  /// Indicating the item's visibility
  ///
  /// iOS does not have a general-purpose way to view keychain items, so this propery make sense only with sync
  /// to a Mac via iCloud Keychain, than you might want to make it invisible there.
  ///
  /// For more information, see [Keychain Services](https://developer.apple.com/documentation/security/ksecattrisinvisible)
  public var isInvisible: Bool?
  
  /// Indicating whether the item has a valid password
  ///
  /// This is useful if your application doesn't want a password for some particular service to be stored in the keychain,
  /// but prefers that it always be entered by the user.
  ///
  /// For more information, see [Keychain Services](https://developer.apple.com/documentation/security/ksecattrisnegative)
  public var isNegative: Bool?
  
  /// Construct Generic Password Keychain
  public init(service: String,
              accessible: AccessibilityLevel = .whenUnlocked,
              accessGroup: String? = nil,
              synchronizable: Bool = false) {
    self.itemClass = .genericPassword
    self.service = service
    self.accessible = accessible
    self.accessGroup = accessGroup
    self.synchronizable = synchronizable
  }
  
  /// Construct Internet Password Keychain
  public init(server: URL,
              protocolType: ProtocolType,
              authenticationType: AuthenticationType = .default,
              accessible: AccessibilityLevel = .whenUnlocked,
              accessGroup: String? = nil,
              synchronizable: Bool = false,
              securityDomain: String? = nil) {
    self.itemClass = .internetPassword
    self.server = server
    self.protocolType = protocolType
    self.authenticationType = authenticationType
    self.accessible = accessible
    self.accessGroup = accessGroup
    self.synchronizable = synchronizable
    self.securityDomain = securityDomain
  }
  
  /// Persist value for key in Keychain
  /// - Parameter value: Persisting value
  /// - Parameter key: Key for value
  public func set<T: KeychainSerializable>(_ value: T.Convertible, for key: KeychainKey<T>) throws {
    try T.bridge.set(value, forKey: key.key, in: self)
  }
  
  /// Get value for provided key from Keycina,
  /// - Parameter key: Key for value
  public func get<T: KeychainSerializable>(_ key: KeychainKey<T>) throws -> T.Convertible? {
    try T.bridge.get(key: key.key, from: self)
  }
  
  /// Get value for provided key from Keycina, return default value in case `value == nil` and not error rised
  /// - Parameter key: Key for value
  /// - Parameter defaultProvider: Value retrun by default than value is nil
  public func get<T: KeychainSerializable>(_ key: KeychainKey<T>,
                                           default defaultProvider: @autoclosure () -> T.Convertible) throws -> T.Convertible {
    do {
      if let value = try T.bridge.get(key: key.key, from: self) {
        return value
      }
      return defaultProvider()
    } catch {
      throw error
    }
  }
  
  /// Remove key from specific keychain
  /// - Parameter key: Keychain key to remove
  public func remove<T: KeychainSerializable>(_ key: KeychainKey<T>) throws {
    try T.bridge.remove(key: key.key, from: self)
  }
  
  /// Remove all keys from specific keychain
  public func removeAll() throws {
    let status = Keychain.itemDelete(searchQuery())
    if status != errSecSuccess && status != errSecItemNotFound {
      throw KeychainError(status: status)
    }
  }
  
  /// User `dynamicCallable` syntax sugar to implement `get` keychain value
  ///
  /// NOTE: Current implementation support only single argument and will ignore others.
  ///
  /// Example:
  /// ```
  /// try keychain(.stringKey)
  ///  ```
  /// - Parameter args: KeychainKey object
  public func dynamicallyCall<T: KeychainSerializable>(withArguments args: [KeychainKey<T>]) throws -> T.Convertible? {
    try get(args[0])
  }
  
  /// User `dynamicCallable` syntax sugar to implement `get` keychain value.
  ///
  /// NOTE: Current implementation support only single argument and will ignore others.
  ///
  /// Due to `ambiguous use of method` error it is required to case return type to `Result`
  /// ```
  /// if case .success(let value) = keychain(key) as Result { ... }
  /// ```
  /// - Parameter args: KeychainKey object
  public func dynamicallyCall<T: KeychainSerializable>(withArguments args: [KeychainKey<T>]) -> Result<T.Convertible?, KeychainError> {
    do {
      return .success(try get(args[0]))
    } catch {
      return .failure(KeychainError(error))
    }
  }
  
  /// Subsript fetching from keychain in return result with Result type
  public subscript<T: KeychainSerializable>(key: KeychainKey<T>) -> Result<T.Convertible?, KeychainError> {
    do {
      return .success(try get(key))
    } catch {
      return .failure(KeychainError(error))
    }
  }
  
  /// Subsript with defaul value. In case of error raise fetchin from keychain `.failure` result returns, default
  /// value apply only in case fetch value is nil
  public subscript<T: KeychainSerializable>(key: KeychainKey<T>, default defaultProvider: @autoclosure () -> T.Convertible)
    -> Result<T.Convertible, KeychainError> {
      
      do {
        return .success(try get(key, default: defaultProvider()))
      } catch {
        return .failure(KeychainError(error))
      }
  }
}

extension Keychain {
  func searchQuery(_ extraAttributes: Attributes = Attributes()) -> Attributes {
    var query: Attributes = [
      .class(itemClass),
      .synchronizable(.any)
    ]
    
    switch itemClass {
    case .genericPassword:
      guard let service = service else {
        fatalError("`Service` property is mandatory for saving generic password keychaion item")
      }
      query.append(.service(service))
      
      // TODO: Access group is not supported on any simulators.
      if let accessGroup = accessGroup {
        query.append(.accessGroup(accessGroup))
      }
    case .internetPassword:
      guard let host = server?.host,
        let protocolType = protocolType,
        let authenticationType = authenticationType else {
          fatalError("`Server`, `ProtocolType`, `AuthenticationType` properties are mandatory for saving interner password keychaion item")
      }
      
      query.append(.server(host))
      query.append(.protocolType(protocolType))
      query.append(.authenticationType(authenticationType))
      
      if let port = server?.port {
        query.append(.port(port))
      }
      
      if let path = server?.path {
        query.append(.path(path))
      }
      
      if let securityDomain = securityDomain {
        query.append(.securityDomain(securityDomain))
      }
    }
    
    return query + extraAttributes
  }
  
  /// Use this method to build attributes to add a new keychain entry
  func addRequestAttributes(value: Data, key: String) -> Attributes {
    var attributes = searchQuery()
    
    attributes.append(.account(key))
    attributes += updateRequestAttributes(value: value)
    
    return attributes
  }
  
  /// Use this method to build attributes to update a new keychain entry
  /// Keychain SecItemUpdate do not allow search query parameters and account to pass as attributes
  func updateRequestAttributes(value: Data) -> Attributes {
    var attributes = Attributes()
    
    attributes.append(contentsOf: [
      .valueData(value),
      .accessible(accessible),
      .synchronizable(.init(boolValue: synchronizable))
    ])
    
    if let label = label {
      attributes.append(.label(label))
    }
    
    if let comment = comment {
      attributes.append(.comment(comment))
    }
    
    if let description = attrDescription {
      attributes.append(.attrDescription(description))
    }
    
    if let isInvisible = isInvisible {
      attributes.append(.isInvisible(isInvisible))
    }
    
    if let isNegative = isNegative {
      attributes.append(.isNegative(isNegative))
    }
    
    return attributes
  }
}

extension Keychain {
  // TODO: Maybe use global function instead
  static func itemDelete(_ query: Attributes) -> OSStatus {
    SecItemDelete(query.compose())
  }
  
  static func itemAdd(_ query: Attributes) -> OSStatus {
    SecItemAdd(query.compose(), nil)
  }
  
  static func itemUpdate(_ query: Attributes, _ attributes: Attributes) -> OSStatus {
    SecItemUpdate(query.compose(), attributes.compose())
  }
  
  static func itemFetch(_ query: Attributes) -> OSStatus {
    SecItemCopyMatching(query.compose(), nil)
  }
}

extension ItemClass {
  var rawValue: CFString {
    switch self {
    case .genericPassword:
      return kSecClassGenericPassword
    case .internetPassword:
      return kSecClassInternetPassword
    }
  }
}

extension AccessibilityLevel {
  var rawValue: CFString {
    switch self {
    case .whenPasscodeSetThisDeviceOnly:
      return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
    case .unlockedThisDeviceOnly:
      return kSecAttrAccessibleWhenUnlockedThisDeviceOnly
    case .whenUnlocked:
      return kSecAttrAccessibleWhenUnlocked
    case .afterFirstUnlockThisDeviceOnly:
      return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
    case .afterFirstUnlock:
      return kSecAttrAccessibleAfterFirstUnlock
    case .alwaysThisDeviceOnly:
      return kSecAttrAccessibleAlwaysThisDeviceOnly
    case .accessibleAlways:
      return kSecAttrAccessibleAlways
    }
  }
}

extension ProtocolType {
  var rawValue: String {
    switch self {
    case .ftp:
      return String(kSecAttrProtocolFTP)
    case .ftpAccount:
      return String(kSecAttrProtocolFTPAccount)
    case .http:
      return String(kSecAttrProtocolHTTP)
    case .irc:
      return String(kSecAttrProtocolIRC)
    case .nntp:
      return String(kSecAttrProtocolNNTP)
    case .pop3:
      return String(kSecAttrProtocolPOP3)
    case .smtp:
      return String(kSecAttrProtocolSMTP)
    case .socks:
      return String(kSecAttrProtocolSOCKS)
    case .imap:
      return String(kSecAttrProtocolIMAP)
    case .ldap:
      return String(kSecAttrProtocolLDAP)
    case .appleTalk:
      return String(kSecAttrProtocolAppleTalk)
    case .afp:
      return String(kSecAttrProtocolAFP)
    case .telnet:
      return String(kSecAttrProtocolTelnet)
    case .ssh:
      return String(kSecAttrProtocolSSH)
    case .ftps:
      return String(kSecAttrProtocolFTPS)
    case .https:
      return String(kSecAttrProtocolHTTPS)
    case .httpProxy:
      return String(kSecAttrProtocolHTTPProxy)
    case .httpsProxy:
      return String(kSecAttrProtocolHTTPSProxy)
    case .ftpProxy:
      return String(kSecAttrProtocolFTPProxy)
    case .smb:
      return String(kSecAttrProtocolSMB)
    case .rtsp:
      return String(kSecAttrProtocolRTSP)
    case .rtspProxy:
      return String(kSecAttrProtocolRTSPProxy)
    case .daap:
      return String(kSecAttrProtocolDAAP)
    case .eppc:
      return String(kSecAttrProtocolEPPC)
    case .ipp:
      return String(kSecAttrProtocolIPP)
    case .nntps:
      return String(kSecAttrProtocolNNTPS)
    case .ldaps:
      return String(kSecAttrProtocolLDAPS)
    case .telnetS:
      return String(kSecAttrProtocolTelnetS)
    case .imaps:
      return String(kSecAttrProtocolIMAPS)
    case .ircs:
      return String(kSecAttrProtocolIRCS)
    case .pop3S:
      return String(kSecAttrProtocolPOP3S)
    }
  }
  
  public var description: String {
    switch self {
    case .ftp:
      return "FTP"
    case .ftpAccount:
      return "FTPAccount"
    case .http:
      return "HTTP"
    case .irc:
      return "IRC"
    case .nntp:
      return "NNTP"
    case .pop3:
      return "POP3"
    case .smtp:
      return "SMTP"
    case .socks:
      return "SOCKS"
    case .imap:
      return "IMAP"
    case .ldap:
      return "LDAP"
    case .appleTalk:
      return "AppleTalk"
    case .afp:
      return "AFP"
    case .telnet:
      return "Telnet"
    case .ssh:
      return "SSH"
    case .ftps:
      return "FTPS"
    case .https:
      return "HTTPS"
    case .httpProxy:
      return "HTTPProxy"
    case .httpsProxy:
      return "HTTPSProxy"
    case .ftpProxy:
      return "FTPProxy"
    case .smb:
      return "SMB"
    case .rtsp:
      return "RTSP"
    case .rtspProxy:
      return "RTSPProxy"
    case .daap:
      return "DAAP"
    case .eppc:
      return "EPPC"
    case .ipp:
      return "IPP"
    case .nntps:
      return "NNTPS"
    case .ldaps:
      return "LDAPS"
    case .telnetS:
      return "TelnetS"
    case .imaps:
      return "IMAPS"
    case .ircs:
      return "IRCS"
    case .pop3S:
      return "POP3S"
    }
  }
}

extension AuthenticationType {
  var rawValue: String {
    switch self {
    case .ntlm:
      return String(kSecAttrAuthenticationTypeNTLM)
    case .msn:
      return String(kSecAttrAuthenticationTypeMSN)
    case .dpa:
      return String(kSecAttrAuthenticationTypeDPA)
    case .rpa:
      return String(kSecAttrAuthenticationTypeRPA)
    case .httpBasic:
      return String(kSecAttrAuthenticationTypeHTTPBasic)
    case .httpDigest:
      return String(kSecAttrAuthenticationTypeHTTPDigest)
    case .htmlForm:
      return String(kSecAttrAuthenticationTypeHTMLForm)
    case .`default`:
      return String(kSecAttrAuthenticationTypeDefault)
    }
  }
  
  public var description: String {
    switch self {
    case .ntlm:
      return "NTLM"
    case .msn:
      return "MSN"
    case .dpa:
      return "DPA"
    case .rpa:
      return "RPA"
    case .httpBasic:
      return "HTTPBasic"
    case .httpDigest:
      return "HTTPDigest"
    case .htmlForm:
      return "HTMLForm"
    case .`default`:
      return "Default"
    }
  }
}
