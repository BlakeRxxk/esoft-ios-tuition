//
//  SpecialistView.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import PINRemoteImage
import BaseUI
import BaseFRP
import ThemeManager

public final class SpecialistView: View {
  public var fullName: String {
    set {
      fullNameLabel.styledText = newValue
      avatarView.fullName = newValue
      fullNameLabel.yoga.markDirty()
    }
    get {
      fullNameLabel.styledText ?? ""
    }
  }
  
  public var position: String {
    set {
      positionLabel.styledText = newValue
      positionLabel.yoga.markDirty()
    }
    get {
      positionLabel.styledText ?? ""
    }
  }
  
  public var avatarURL: URL? {
    set {
      avatarView.imageURL = newValue
      avatarView.yoga.markDirty()
    }
    get {
      avatarView.imageURL
    }
  }
  
  public var rightButtonMode: SpecialistView.RightButtonMode = .default {
    didSet {
      updateControlElements()
    }
  }
  
  private(set) lazy var specialistsContainer: UIView = UIView()
  
  private(set) lazy var nameContainer: UIView = UIView()
  private(set) lazy var fullNameLabel: UILabel = UILabel()
  private(set) lazy var positionLabel: UILabel = UILabel()
  
  private(set) lazy var iconViewContainer: UILabel = UILabel()
  private(set) lazy var iconView: IconView = IconView()
  private(set) lazy var avatarView: Avatar = Avatar()
  
  internal lazy var layoutController: LayoutController = LayoutController()
  internal lazy var layout: Layout = Layout()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    configureLayout(block: layout.container)
    
    specialistsContainer.configureLayout(block: layout.specialistsContainer)
    avatarView.configureLayout(block: layout.avatarView)
    iconViewContainer.configureLayout(block: layout.iconViewContainer)
    iconView.configureLayout(block: layout.iconView)
    nameContainer.configureLayout(block: layout.nameContainer)
    fullNameLabel.configureLayout(block: layout.fullNameLabel)
    positionLabel.configureLayout(block: layout.positionLabel)
    
    yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    nameContainer.addSubview <^> [
      fullNameLabel,
      positionLabel
    ]
    
    specialistsContainer.addSubview <^> [
      avatarView,
      nameContainer,
      iconViewContainer
    ]
    
    addSubview <^> [
      specialistsContainer
    ]
  }
  
  private func configureUI() {
    iconView.image = UIImage.Arrow.Right.small
    iconView.tintColor = ThemeManager.current().colors.divider
    
    fullNameLabel.setStyles(
      UILabel.Styles.headline,
      UILabel.ColorStyle.primary,
      UILabel.Styles.multiline
    )
    
    positionLabel.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.placeholders,
      UILabel.Styles.singleLine
    )
  }
  
  private func updateControlElements() {
    updateRightButton()
  }
}

extension SpecialistView: SpecialistsInput {}
