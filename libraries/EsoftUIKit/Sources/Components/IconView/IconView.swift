//
//  IconView.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import BaseUI
import YogaKit

public final class IconView: View {
  public var image: UIImage {
    get {
      imageView.image ?? UIImage()
    }
    set {
      invalidateIntrinsicContentSize()
      imageView.image = newValue
      imageView.yoga.markDirty()
    }
  }
  
  override public var intrinsicContentSize: CGSize {
    imageView.yoga.intrinsicSize
  }
  
  private(set) lazy var imageView: UIImageView = UIImageView()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = min(frame.width, frame.height) / 2
    
    yoga.isEnabled = true
    imageView.yoga.isEnabled = true
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  override public func tintColorDidChange() {
    applyStyles()
  }
  
  private func createUI() {
    addSubview(imageView)
  }
  
  private func configureUI() {
    imageView.contentMode = .center
  }
}

extension IconView: IconViewInput {}
