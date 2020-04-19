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
    let rootView = ViewController()
    let rootViewController = UINavigationController(rootViewController: rootView)
    
    ThemeManager.apply(theme: .client)
    
    rootViewController.navigationBar.shadowImage = UIImage()
    rootViewController.navigationBar.isTranslucent = false
    rootViewController.navigationBar.barTintColor = ThemeManager.current().colors.container

    window = UIWindow()
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    
    return true
  }
  
}
