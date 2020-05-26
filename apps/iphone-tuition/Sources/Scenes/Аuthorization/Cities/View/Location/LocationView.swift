//
//  LocationView.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import YogaKit
import BaseUI
import ThemeManager

public final class LocationView: View {
  public var location: String? {
    get {
      locationLabel.text
    }
    set {
      // убрать это отсуда
//      locationLabel.styledText = newValue ?? Localized.locating
    }
  }
  
  private(set) lazy var iconImageView: UIImageView = UIImageView()
  private(set) lazy var locationLabel: UILabel = UILabel()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .row
      layout.alignItems = .center
    })
    
    iconImageView.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 20
      layout.height = 20
    })
    
    locationLabel.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 1
      layout.height = 22
      layout.marginLeft = 34
      layout.flexGrow = 1
    })
    
    yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    [
      iconImageView,
      locationLabel
      ].forEach { self.addSubview($0) }
  }
  
  private func configureUI() {
    // Сделать стиль для UIImageView
    iconImageView.image = UIImage.Spinners.base
    iconImageView.tintColor = ThemeManager.current().colors.primary500
    
    locationLabel.setStyles(
      UILabel.Styles.headline,
      UILabel.ColorStyle.primary500,
      UILabel.Styles.singleLine
    )
    
    locationLabel.styledText = Localized.locating
  }
}

extension LocationView : LocationInput {}

// Убрать это отсюда
extension LocationView {
  enum Localized {
    static let locating = "Определяем местоположение"
  }
}
