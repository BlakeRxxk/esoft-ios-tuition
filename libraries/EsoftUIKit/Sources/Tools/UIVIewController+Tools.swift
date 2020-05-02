//
//  UIVIewController+Tools.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIViewController {
  static public func topbarHeight() -> CGFloat {
    let nVc = UINavigationController(rootViewController: UIViewController())
    let navBarHeight = nVc.navigationBar.frame.size.height
    let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
    return navBarHeight + statusBarHeight
  }
}
