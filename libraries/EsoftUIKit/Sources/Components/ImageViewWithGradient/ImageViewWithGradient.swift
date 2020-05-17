//
//  ImageViewWithGradient.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import BaseUI
import BaseFRP

public final class ImageViewWithGradient: View {
  public var viewUUID: String = UUID().uuidString

  private(set) lazy var container: UIView = UIView()
  private(set) lazy var gradientView: UIView = UIView()

  public lazy var imageView: UIImageView = UIImageView()

  override public init() {
    super.init()

    createUI()
    configureUI()
    layout()
  }

  public func setImageGradient(colors: [UIColor] = [ UIColor.Color.shadow,
                                                UIColor.clear ],
                               direction: DirectionGradient = .vertically,
                               locations: (Double, Double) = (0, 1)) {
    gradientView.setGradient(
      colors: colors,
      direction: direction,
      locations: locations,
      size: frame.size
    )
  }

  private func createUI() {
    let subviews: [UIView] = [
      container,
      imageView,
      gradientView
    ]

    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }

    container.addSubview(imageView)
    container.addSubview(gradientView)

    addSubview <^> [
      container
    ]
  }

  private func configureUI() {
    imageView.backgroundColor = UIColor.white
    imageView.contentMode = .center
    imageView.layer.masksToBounds = true
    imageView.contentMode = .scaleAspectFill
  }

  private func layout() {
    let constraints = [
      container.topAnchor.constraint(equalTo: topAnchor),
      container.leadingAnchor.constraint(equalTo: leadingAnchor),
      container.trailingAnchor.constraint(equalTo: trailingAnchor),
      container.bottomAnchor.constraint(equalTo: bottomAnchor),

      imageView.topAnchor.constraint(equalTo: container.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),

      gradientView.topAnchor.constraint(equalTo: container.topAnchor),
      gradientView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      gradientView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      gradientView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
    ]

    NSLayoutConstraint.activate(constraints)
  }

}
