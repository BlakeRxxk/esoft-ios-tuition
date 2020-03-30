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
    let rootView = AutoLayoutKitViewController()
    let rootViewController = UINavigationController(rootViewController: rootView)
    
    window = UIWindow()
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    
    return true
  }
  
}
