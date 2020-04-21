//
//  UIViewController+Tools.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by nedstar on 21.04.2020.
//

import Atlas
import UIKit
import ThemeManager

extension UIViewController {
  // If the current controller is inside the navigation controller and is the only one on the navigation stack,
  // then display a styled close button in the left part of the navigation bar.
  public func addCloseButtonIfNeeded(target: AnyObject = self as AnyObject) {
    guard navigationController?.viewControllers.first === self else { return }
    
    let item = UIBarButtonItem()
    item.setStyles(UIBarButtonItem.Styles.close)
    item.target = target
    navigationItem.leftBarButtonItem = item
  }
}
