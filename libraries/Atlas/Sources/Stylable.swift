//
//  Stylable.swift
//  Atlas
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

public protocol Stylable: NSObjectProtocol {
  /**
   Set and apply styles to element.
   
   - note: Use this method for applying styles.
   
   - parameter styles: styles to apply
   */
  func setStyles(_ styles: Style...)
  
  /**
   Remove styles from element.
   
   - note: This does not remove style changes. But previous styles reapply.
   
   - parameter style: style for remove
   */
  func removeStyle(_ style: Style)
  
  /**
   Append style to element. If style already exist do nothing.
   
   - parameter style: style for append
   */
  func appendStyle(_ style: Style)
  
  /**
   Apply the set styles.
   */
  func applyStyles()
}

extension Stylable {
  
  public func setStyles(_ styles: Style...) {
    self.styles = styles
      .map { $0.name }
      .joined(separator: " ")
  }
  
  public func removeStyle(_ style: Style) {
    styles = styles?.components(separatedBy: " ")
      .filter { $0 != style.name }
      .joined(separator: " ")
  }
  
  public func appendStyle(_ style: Style) {
    guard styles?.components(separatedBy: " ").contains(style.name) != true else {
      return
    }
    styles = [styles, style.name]
      .compactMap { $0 }
      .joined(separator: " ")
  }
  
  public func applyStyles() {
    styles?.components(separatedBy: " ")
      .compactMap { StyleStorage.shared.styles[$0] }
      .flatMap { $0 }
      .forEach { $0(self) }
  }
}

private enum AssociatedKeys {
  /**
   Key for associated property
   */
  static var style = "EsoftUI_StyleAssociatedKey"
}

private extension Stylable {
  /**
   View's styles separated by space symbol.
   Changing this property call apply styles method.
   */
  var styles: String? {
    get {
      objc_getAssociatedObject(self, &AssociatedKeys.style) as? String
    }
    set {
      objc_setAssociatedObject(self,
                               &AssociatedKeys.style,
                               newValue,
                               objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      
      if newValue != nil {
        applyStyles()
      }
    }
  }
}

extension UIView: Stylable {}
extension UINavigationItem: Stylable {}
extension UIBarItem: Stylable {}
extension UIAlertController: Stylable {}
