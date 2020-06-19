//
//  AuthInputViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 19.06.2020.
//

import UIKit
import IGListKit

public final class AuthInputViewModel: NSObject {
  public typealias Formatter = (String) -> String
  
  public let id: Int
  public let placeholder: String?
  public let showButton: Bool
  public let formatter: Formatter?
  public let keyboardType: UIKeyboardType
  public let errorMessage: String?
  
  public init(id: Int,
              placeholder: String?,
              showButton: Bool,
              formatter: Formatter? = nil,
              keyboardType: UIKeyboardType = .default,
              errorMessage: String? = nil) {
    self.id = id
    self.placeholder = placeholder
    self.showButton = showButton
    self.formatter = formatter
    self.keyboardType = keyboardType
    self.errorMessage = errorMessage
  }
}

extension AuthInputViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? AuthInputViewModel else { return false }
    return self == object
  }
}

extension AuthInputViewModel {
  public static func == (lhs: AuthInputViewModel, rhs: AuthInputViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
