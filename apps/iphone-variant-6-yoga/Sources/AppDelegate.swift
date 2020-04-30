//
//  AppDelegate.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  public var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    AppTheme.apply(theme: .client)

    window = UIWindow()
    let rootVC = UINavigationController(rootViewController: MyViewController())
    rootVC.navigationBar.setStyles(UINavigationBar.Styles.default)
    
    window?.rootViewController = rootVC
    window?.makeKeyAndVisible()

    return true
  }
  
}
