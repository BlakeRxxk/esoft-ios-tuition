//
//  AppDelegate.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import ThemeManager
import EsoftUIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  public var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let rootView = AutoLayoutViewController()
    let rootViewController = UINavigationController(rootViewController: rootView)
    
    ThemeManager.apply(theme: .client)
    
    rootViewController.navigationBar.isTranslucent = false
    rootViewController.navigationBar.barTintColor = ThemeManager.current().colors.defaultTopBar
    rootViewController.navigationBar.tintColor = ThemeManager.current().textColors.white
    rootViewController.navigationBar.titleTextAttributes = [
      .foregroundColor: ThemeManager.current().textColors.white
    ]
    rootViewController.navigationBar.shadowImage = nil
    rootViewController.navigationBar.layoutMargins = UIEdgeInsets(top: 0,
                                                                  left: Space.small,
                                                                  bottom: 0,
                                                                  right: Space.small)
    rootViewController.navigationBar.preservesSuperviewLayoutMargins = true
    
    window = UIWindow()
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    
    return true
  }
  
}
