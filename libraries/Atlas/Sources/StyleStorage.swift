//
//  StyleStorage.swift
//  Atlas
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

/**
 Class for storing styles.
 
 - note: Don't use manualy.
 */
final class StyleStorage {
  /**
   Stored styles.
   
   - note: Don't use manualy.
   */
  var styles: [String: [(Stylable) -> Void]] = [:]
  
  private init() {}
  
  /**
   Shared styles storage.
   
   - note: Don't use manualy.
   */
  static let shared = StyleStorage()
  
  /**
   Register style the processing method for key.
   
   - note: Don't call manualy, use `Style.init(name:process:)` instead.
   
   - parameter name: the name of the style
   - parameter process: a method of processing style
   */
  func register<T: Stylable>(name: String, process: @escaping (T) -> Void) {
    let wrappingStyle = { (view: Stylable) in
      guard let view = view as? T else {
        return
      }
      process(view)
    }
    
    if styles[name] == nil {
      styles[name] = [wrappingStyle]
    } else {
      styles[name]?.append(wrappingStyle)
    }
  }
}
