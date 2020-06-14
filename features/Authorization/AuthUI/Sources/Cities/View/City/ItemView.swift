//
//  AuthCityView.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import UIKit
import YogaKit
import BaseUI
import ThemeManager

public final class ItemView: View {
  public var title: String {
    get {
      titleLabel.text ?? ""
    }
    set {
      titleLabel.styledText = newValue
    }
    
  }
  public var secondaryText: String? {
    get {
      secondaryLabel.text
    }
    set {
      secondaryLabel.styledText = newValue
    }
  }
  public var lockSignText: String? {
    get {
      lockSignLabel.text
    }
    set {
      lockSignLabel.styledText = newValue
      updateControlElements() // не оч
    }
  }
  
  private(set) lazy var leftContentView: UIView = UIView()
  private(set) lazy var titleLabel: UILabel = UILabel()
  private(set) lazy var secondaryLabel: UILabel = UILabel()
  private(set) lazy var lockSignLabel: UILabel = UILabel() // поменять на кнопку и сделать out
  
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
    
    leftContentView.configureLayout(block: layout.leftContentView)
    titleLabel.configureLayout(block: layout.titleLabel)
    secondaryLabel.configureLayout(block: layout.secondaryLabel)
    lockSignLabel.configureLayout(block: layout.lockSignLabel)
    
    yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    [
      titleLabel,
      secondaryLabel
      ].forEach { leftContentView.addSubview($0) }
    
    [
      leftContentView,
      lockSignLabel
      ].forEach { self.addSubview($0) }
  }
  
  private func configureUI() {
    titleLabel.setStyles(
      UILabel.Styles.regular,
      UILabel.ColorStyle.primary,
      UILabel.Styles.singleLine
    )
    
    secondaryLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.placeholders,
      UILabel.Styles.doubleLine
    )
    
    lockSignLabel.setStyles(
      UILabel.Styles.alignCenter,
      UILabel.Styles.singleLine,
      UILabel.ColorStyle.inverse
    )
    
    // Запаковать в стили
    lockSignLabel.font = UIFont.betweenSmallTiny
    lockSignLabel.layer.cornerRadius = 12
    lockSignLabel.layer.masksToBounds = true
    lockSignLabel.backgroundColor = UIColor.Color.sienna500
  }
  
  private func updateControlElements() {
    updateTitleLabel()
    updateSecondaryLabel()
    updateLockSignLabel()
  }
}

extension ItemView: ItemViewInput {}
