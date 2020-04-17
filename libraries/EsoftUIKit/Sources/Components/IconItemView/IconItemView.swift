//
//  IconItemView.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager
import YogaKit

public final class IconItemView: View {
  public var title: String {
    get {
      titleLabel.styledText ?? ""
    }
    set {
      titleLabel.styledText = newValue
    }
  }
  
  public var leftIcon: UIImage? {
    get {
      iconView.image
    }
    set {
      iconView.image = newValue ?? UIImage()
    }
  }

  private(set) lazy var iconView: UIImageView = UIImageView()
  private(set) lazy var titleLabel: UILabel = UILabel()
  
  private var activeConstraints: [NSLayoutConstraint] = []

  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  private func createUI() {
    addSubview(iconView)
    addSubview(titleLabel)
  }

  private func configureUI() {
    iconView.tintColor = ThemeManager.current().colors.primary500

    titleLabel.setStyles(
      UILabel.Styles.headline,
      UILabel.ColorStyle.primary500
    )
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 48
      layout.padding = 16
      layout.flexDirection = .row
      layout.alignItems = .flexStart
    }
    
    iconView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 24
      layout.height = 24
    }
    
    titleLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 32
      layout.flexGrow = 1
      layout.flexShrink = 1
    }

    yoga.applyLayout(preservingOrigin: true)
  }
  
  @objc func handleAction() {}
}

extension IconItemView: IconItemViewInput {}
