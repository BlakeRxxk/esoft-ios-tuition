//
//  ViewController.swift
//  BaseUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

open class ViewController<View: UIView>: UIViewController {
  private let viewCreator: () -> View
  
  public var specializedView: View {
      unsafeDowncast(view, to: View.self)
  }
  
  public init(viewCreator: @escaping () -> View) {
      self.viewCreator = viewCreator
      super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable, message: "NSCoder and Interface Builder is not supported. Use Programmatic layout.")
  required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override public func loadView() {
      view = viewCreator()
  }
}
