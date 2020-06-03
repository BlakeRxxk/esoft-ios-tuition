//
//  InteractiveModalTransitioningDelegate.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit

public final class InteractiveModalTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
  var interactiveDismiss = true
  
  init(from presented: UIViewController, to presenting: UIViewController) {
    super.init()
  }
  
  public func presentationController(forPresented presented: UIViewController,
                                     presenting: UIViewController?,
                                     source: UIViewController) -> UIPresentationController? {
    InteractiveModalPresentationController(presentedViewController: presented, presenting: presenting)
  }
}
