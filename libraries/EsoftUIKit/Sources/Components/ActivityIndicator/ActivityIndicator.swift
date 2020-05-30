//
//  ActivityIndicator.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

public class ActivityIndicator: UIView {
  override public class var layerClass: AnyClass {
    CAShapeLayer.self
  }
  
  public var strokeWidth: CGFloat {
    get {
      spinnerLayer.lineWidth
    }
    set {
      spinnerLayer.lineWidth = newValue
    }
  }
  
  public var spinnerSize: CGFloat {
    didSet {
      guard spinnerSize != oldValue else { return }
      spinnerLayer.path = UIBezierPath(arcCenter: CGPoint(x: spinnerSize / 2, y: spinnerSize / 2),
                                       radius: spinnerSize / 2,
                                       startAngle: 0,
                                       endAngle: CGFloat.pi,
                                       clockwise: false).cgPath
      invalidateIntrinsicContentSize()
    }
  }
  
  public var spinnerColor: UIColor? {
    get {
      spinnerLayer.strokeColor.map(UIColor.init)
    }
    set {
      spinnerLayer.strokeColor = newValue?.cgColor
    }
  }
  
  let spinnerAnimation: CAAnimation = {
    let infiniteClockwiseRotation = CABasicAnimation(keyPath: "transform.rotation.z")
    infiniteClockwiseRotation.fromValue = 0
    infiniteClockwiseRotation.toValue = 2 * CGFloat.pi
    infiniteClockwiseRotation.duration = 1
    infiniteClockwiseRotation.repeatCount = Float.infinity
    infiniteClockwiseRotation.isRemovedOnCompletion = false
    return infiniteClockwiseRotation
  }()
  
  lazy var spinnerLayer: CAShapeLayer = {
    guard let layer = self.layer as? CAShapeLayer else {
      assertionFailure("layer is not CAShapeLayer")
      return CAShapeLayer()
    }
    return layer
  }()
  
  override public var backgroundColor: UIColor? {
    didSet {
      spinnerLayer.fillColor = backgroundColor?.cgColor
    }
  }
  
  override public var intrinsicContentSize: CGSize {
    CGSize(width: spinnerSize, height: spinnerSize)
  }
  
  override init(frame: CGRect = .zero) {
    spinnerSize = min(frame.height, frame.width)
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    spinnerSize = 0
    super.init(coder: aDecoder)
    setupView()
  }
  
  public func startAnimating() {
    isHidden = false
    spinnerLayer.add(spinnerAnimation, forKey: "spinnerAnimation")
  }
  
  public func stopAnimating() {
    spinnerLayer.removeAnimation(forKey: "spinnerAnimation")
    isHidden = true
  }
  
  override public func tintColorDidChange() {
    applyStyles()
  }
}

// MARK: - Private
private extension ActivityIndicator {
  func setupView() {
    isHidden = true
    spinnerLayer.fillColor = UIColor.clear.cgColor
  }
}
