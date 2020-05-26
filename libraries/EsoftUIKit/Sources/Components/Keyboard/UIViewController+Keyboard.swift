//
//  UIViewController+Keyboard.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

public extension KeyboardObserver where Self: UIViewController {
  // Returns a Boolean value indicating whether the observer is subscribed to keyboard notifications
  var isSubscribedToKeyboardNotifications: Bool {
    KeyboardObservable.shared.isSubscribed(self)
  }

  // Add self to keyboard changes observers.
  // Starts receiving notifications implemented in KeyboardObserver.
  func startKeyboardObserving() {
    KeyboardObservable.shared.addKeyboardObserver(self)
  }
  
  // Remove self from keyboard changes observers.
  // Stops receiving notifications implemented in KeyboardObserver.
  func stopKeyboardObserving() {
    KeyboardObservable.shared.removeKeyboardObserver(self)
  }
  
  // Calculate keyboard Y offset, include ios 11 safe area guide
  func keyboardYOffset(from keyboardFrame: CGRect) -> CGFloat? {
    let convertedKeyboardFrame = view.convert(keyboardFrame, from: nil)
    let intersectionViewFrame = convertedKeyboardFrame.intersection(view.bounds)
    var safeOffset: CGFloat = 0
    if #available(iOS 11.0, *) {
      let intersectionSafeFrame = convertedKeyboardFrame.intersection(view.safeAreaLayoutGuide.layoutFrame)
      safeOffset = intersectionViewFrame.height - intersectionSafeFrame.height
    }
    let intersectionOffset = intersectionViewFrame.size.height
    guard convertedKeyboardFrame.minY.isInfinite == false else {
      return nil
    }
    let keyboardOffset = intersectionOffset + safeOffset
    return keyboardOffset
  }
}

extension UIViewController {
  func removeKeyboardObservers() {
    if let observer = self as? KeyboardObserver {
      KeyboardObservable.shared.removeKeyboardObserver(observer)
    }
    
    children.forEach {
      $0.removeKeyboardObservers()
    }
  }
  
  func appendKeyboardObservers() {
    if let observer = self as? KeyboardObserver {
      KeyboardObservable.shared.addKeyboardObserver(observer)
    }
    
    children.forEach {
      $0.appendKeyboardObservers()
    }
  }
}
