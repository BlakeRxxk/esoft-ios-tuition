//
//  IconItemView.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import BaseUI
import BaseFRP

public final class IconItemView: View {
  public var viewID: String = ""
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
      leftIconView.image
    }
    set {
      leftIconView.image = newValue ?? UIImage()
      leftIconView.yoga.markDirty()
    }
  }
  
  public var rightIcon: UIImage? {
    get {
      rightIconView.image
    }
    set {
      rightIconView.image = newValue ?? UIImage()
    }
  }
  
  public var topBorderMode: IconItemView.TopBorderMode = .default {
    didSet {
      updateControlElements()
    }
  }
  
  public var bottomBorderMode: IconItemView.BottomBorderMode = .default {
    didSet {
      updateControlElements()
    }
  }
  
  public var leftIconMode: IconItemView.LeftButtonMode = .default {
    didSet {
//      leftIconView.yoga.markDirty()
      updateControlElements()
    }
  }
  
  public var rightIconMode: IconItemView.RightButtonMode = .default {
    didSet {
      rightIconView.yoga.markDirty()
      updateControlElements()
    }
  }
  
  public weak var output: IconItemViewOutput?

  private(set) lazy var topDivider: UIView = UIView()
  private(set) lazy var leftIconView: IconView = IconView()
  private(set) lazy var rightIconView: IconView = IconView()
  private(set) lazy var titleLabel: UILabel = UILabel()
  private(set) lazy var bottomDivider: UIView = UIView()
  
  internal lazy var layout: Layout = Layout()
  internal lazy var layoutController: LayoutController = LayoutController()

  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }

  private func createUI() {
    addSubview <^> [
      titleLabel
    ]
  }
  
  private func configureUI() {
    topDivider.setStyles(UIView.Styles.divider)
    bottomDivider.setStyles(UIView.Styles.divider)

    titleLabel.setStyles(
      UILabel.Styles.regular,
      UILabel.Styles.singleLine
    )
    
    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
    addGestureRecognizer(action)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    configureLayout(block: layout.container)
    
    titleLabel.configureLayout(block: layout.title)

    yoga.applyLayout(preservingOrigin: true)
  }
  
  private func updateControlElements() {
    updateTopBorder()
    updateBottomBorder()
    updateLeftIcon()
    updateRightIcon()
  }
  
  @objc private func handleTapAction() {
    output?.didTapAction(in: self)
  }
}

extension IconItemView: IconItemViewInput {}
