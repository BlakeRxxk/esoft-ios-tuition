//
//  UIScreen+SafeAreaInsets.swift
//  AutoLayoutKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

extension UIScreen {
  public static var safeAreaInsets: UIEdgeInsets {
    guard let rootView = UIApplication.shared.keyWindow else { return .zero }
    
    if #available(iOS 11.0, *) {
      return rootView.safeAreaInsets
    } else {
      return .zero
    }
  }
}
