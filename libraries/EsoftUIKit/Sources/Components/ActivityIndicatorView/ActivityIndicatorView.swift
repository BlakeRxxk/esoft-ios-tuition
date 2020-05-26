//
//  ActivityIndicatorView.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import BaseUI

public final class ActivityIndicatorView: View {
  
  public private(set) var activity: ActivityIndicator = ActivityIndicator()
  
  override public var intrinsicContentSize: CGSize {
    let sideSize = activity.spinnerSize * 2 + activity.strokeWidth
    return CGSize(width: sideSize, height: sideSize)
  }
  
  override public init() {
    super.init()
    createUI()
    configureUI()
  }
  
  private func createUI() {
    addSubview(activity)
  }
  
  private func configureUI() {}
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.alignItems = .center
      layout.justifyContent = .center
    }
    
    activity.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue.base
      layout.height = YGValue.base
    }
    
    yoga.applyLayout(preservingOrigin: true)
  }
}
