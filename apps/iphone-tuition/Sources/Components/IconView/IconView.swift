//
//  IconView.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit

public final class IconView: UIView {
  override public var intrinsicContentSize: CGSize {
    imageView.yoga.intrinsicSize
  }

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
  
  let imageView: UIImageView = {
    $0.contentMode = .center
    return $0
  }(UIImageView())
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setupView()
  }
  
  private func setupView() {
    addSubview(imageView)
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
}

extension IconView: IconViewInput {}
