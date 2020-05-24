//
//  ListHeader.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import BaseUI
import BaseFRP
import ThemeManager

public final class ListHeader: View {
  public var headerTitle: String {
    set {
      title.styledText = newValue
      title.yoga.markDirty()
    }
    get {
      title.styledText ?? ""
    }
  }
  
  public var iconImage: UIImage? {
    set {
      guard let newImage = newValue else { return }
      iconImageView.image = newImage
    }
    get {
      iconImageView.image
    }
  }
  
  public weak var output: ListHeaderViewOutput?
  
  private(set) lazy var title: UILabel = UILabel()
  private(set) lazy var iconImageView: IconView = IconView()
  private(set) lazy var iconContainer: UIView = UIView()
  
  internal lazy var layout: Layout = Layout()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout(block: layout.container)
    
    title.configureLayout(block: layout.title)
    iconContainer.configureLayout(block: layout.iconContainer)
    iconImageView.configureLayout(block: layout.iconImageView)
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    iconContainer.addSubview <^> [
      iconImageView
    ]
    addSubview <^> [
      title,
      iconContainer
    ]
  }
  
  private func configureUI() {
    title.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.secondary
    )
    
    iconImageView.tintColor = ThemeManager.current().colors.icon
    
    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
    addGestureRecognizer(action)
  }
  
  @objc private func handleTapAction() {
    output?.didTapAction(in: self)
  }
}

extension ListHeader: ListHeaderViewInput {}
