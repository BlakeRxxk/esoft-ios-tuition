//
//  LeakInspectorAlertProvider.swift
//  LeakInspector
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

@objc public class LeakInspectorAlertProvider: NSObject, LeakInspectorDelegate {
  
  private weak var alertController: UIAlertController?
  
  public func didLeakReference(_ ref: AnyObject, name: String) {
    // dismiss any already visible alert
    if let alertController = self.alertController {
      alertController.dismiss(animated: false, completion: nil)
    }
    
    let title = "Leak Inspector"
    let message = "Detected possible leak of \(name)"
    let ok = "OK"
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: ok, style: .default, handler: nil))
    alertController.show()
    self.alertController = alertController
  }
  
}

extension UIAlertController {
  
  func show() {
    present(animated: true, completion: nil)
  }
  
  func present(animated: Bool, completion: (() -> Void)?) {
    if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
      present(from: rootVC, animated: animated, completion: completion)
    }
  }
  
  private func present(from controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
    if let presentedViewController = controller.presentedViewController {
      present(from: presentedViewController, animated: animated, completion: completion)
    } else if  let navVC = controller as? UINavigationController, let visibleVC = navVC.visibleViewController {
      present(from: visibleVC, animated: animated, completion: completion)
    } else if let tabVC = controller as? UITabBarController, let selectedVC = tabVC.selectedViewController {
      present(from: selectedVC, animated: animated, completion: completion)
    } else {
      controller.present(self, animated: animated, completion: completion)
    }
  }
  
}
