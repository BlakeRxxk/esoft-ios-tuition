//
//  InteractiveModalPresentationController.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit

public final class InteractiveModalPresentationController: UIPresentationController {
  private var presentedYOffset: CGFloat = UIViewController.topbarHeight() + 1
  
  private lazy var dimmingView: UIView? = {
    guard let container = containerView else { return nil }
    
    let view = UIView(frame: container.bounds)
    view.addGestureRecognizer(
      UITapGestureRecognizer(target: self, action: #selector(didTap(tap:)))
    )
    
    return view
  }()
  
  override public var frameOfPresentedViewInContainerView: CGRect {
    guard let container = containerView else { return .zero }
    
    return CGRect(x: 0,
                  y: presentedYOffset,
                  width: container.bounds.width,
                  height: container.bounds.height - presentedYOffset)
  }
  
  @objc func didTap(tap: UITapGestureRecognizer) {
    presentedViewController.dismiss(animated: true, completion: nil)
  }
  
  override public func dismissalTransitionDidEnd(_ completed: Bool) {
    super.dismissalTransitionDidEnd(completed)
    if completed {
      dimmingView?.removeFromSuperview()
    }
  }
}
