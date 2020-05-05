//
//  UIViewController+Tools.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Atlas
import UIKit
import ThemeManager

extension UIViewController {
  // If the current controller is inside the navigation controller and is the only one on the navigation stack,
  // then display a styled close button in the left part of the navigation bar.
  public func addCloseButtonIfNeeded(target: AnyObject = self as AnyObject, action: Selector) {
    guard navigationController?.viewControllers.first === self else { return }
    
    let item = UIBarButtonItem()
    item.setStyles(UIBarButtonItem.Styles.close)
    item.target = target
    item.action = action
    navigationItem.leftBarButtonItem = item
  }

  static public func topbarHeight() -> CGFloat {
    let viewController = UINavigationController(rootViewController: UIViewController())
    let navBarHeight = viewController.navigationBar.frame.size.height
    let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
    return navBarHeight + statusBarHeight
  }
}
