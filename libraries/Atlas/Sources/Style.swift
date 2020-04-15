//
//  Style.swift
//  Atlas
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

public struct Style {
  /**
   The name of the style
   */
  let name: String
  
  /**
   Creates an instance of the style without registering in style storage.
   
   - parameter name: the name of the style
   */
  init(name: String) {
    self.name = name
  }
  
  /**
   Creates and registers a new style.
   
   - parameter name: the name of the style
   - parameter process: a method of processing style
   */
  init<T: Stylable>(name: String, process: @escaping (T) -> Void) {
    assert(name.contains(" ") == false, "The style name must not contain space characters")
    self.init(name: name.replacingOccurrences(of: " ", with: "_"))
    StyleStorage.shared.register(name: name, process: process)
  }
}

/**
 Combine two style in one.
 
 - parameter lhs: first style
 - parameter rhs: second style
 */
func + (lhs: Style, rhs: Style) -> Style {
  Style(name: lhs.name + " " + rhs.name)
}
