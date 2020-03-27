//
//  View.swift
//  BaseUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

open class View: UIView {
  public init() {
    super.init(frame: .zero)
  }
  
  @available(*, unavailable, message: "NSCoder and Interface Builder is not supported. Use Programmatic layout.")
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
