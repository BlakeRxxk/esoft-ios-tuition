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
  public lazy var colors: [UIColor] = [
    UIColor.Color.shadow,
    UIColor.clear
  ]
  public lazy var direction: DirectionGradient = .vertically
  public lazy var locations: (Double, Double) = (0, 1)

  override public init() {
    super.init()

    createUI()
    configureUI()
    layout()
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
    container.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

    imageView.backgroundColor = UIColor.white
    imageView.contentMode = .center
    imageView.layer.masksToBounds = true
    imageView.contentMode = .scaleAspectFill

    gradientView.setGradient(
      colors: colors,
      direction: direction,
      locations: locations
    )
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
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0/1.5),

      gradientView.topAnchor.constraint(equalTo: container.topAnchor),
      gradientView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      gradientView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      gradientView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
    ]

    NSLayoutConstraint.activate(constraints)
  }

}
