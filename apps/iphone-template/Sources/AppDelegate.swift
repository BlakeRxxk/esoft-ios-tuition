//
//  AppDelegate.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import NeedleFoundation
import PINRemoteImage
import PINCache

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  public var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    registerProviderFactories()

    AppTheme.apply(theme: .client)
    
    window = UIWindow()
    let rootComponent = RootComponent()

    window?.rootViewController = rootComponent.rootViewController
    window?.makeKeyAndVisible()

    setupImages()

    return true
  }
  
}

extension AppDelegate {
  func setupImages() {
    let imageManager: PINRemoteImageManager = PINRemoteImageManager.shared()

    imageManager.setProgressiveRendersMaxProgressiveRenderSize(Constants.maxProgressiveSize, completion: nil)
    imageManager.setProgressiveRendersShouldBlur(true, completion: nil)
    
    let cache: PINCache = imageManager.cache
    cache.diskCache.byteLimit = Constants.diskLimit
    cache.diskCache.ageLimit = Constants.ageLimit
  }
}

private extension AppDelegate {
  enum Constants {
    static let fetchInterval: Double = 900.0
    static let maxProgressiveSize: CGSize = CGSize.init(width: 1024, height: 1024)
    static let diskLimit: UInt = 50 * 1024 * 1024 // limit cache with 50MB
    static let ageLimit: TimeInterval = 60 * 60 * 24 * 10 // limit cache age with 10 days
  }
}
