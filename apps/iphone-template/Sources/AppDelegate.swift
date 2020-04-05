//
//  AppDelegate.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
#if DEBUG
import DBDebugToolkit
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  public var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    #if DEBUG
    DBDebugToolkit.setup()
    #endif
    window = UIWindow()
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
    
    return true
  }
  
}
