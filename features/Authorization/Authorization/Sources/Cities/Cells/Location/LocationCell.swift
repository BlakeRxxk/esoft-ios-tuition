//
//  LocationCell.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import YogaKit
import EsoftUIKit
import ThemeManager

public final class LocationCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "LocationCellID"
  
  public var location: String? {
      get {
        locationLabel.text
      }
      set {
        locationLabel.styledText = newValue ?? Localized.locating
        // После этого обновлять
      }
    }
  
  private(set) lazy var locationContainer: UIView = UIView()
  private(set) lazy var iconImageView: UIImageView = UIImageView()
  private(set) lazy var locationLabel: UILabel = UILabel()
  
  public weak var output: LocationCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
//  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    subviews.forEach {
//      $0.yoga.markDirty()
//    }
//    yoga.applyLayout(preservingOrigin: true)
//    super.traitCollectionDidChange(previousTraitCollection)
//  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = contentView.bounds.size
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    locationContainer.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.marginHorizontal = 16
      layout.marginVertical = 13
      layout.flexDirection = .row
    })
    
    iconImageView.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 20
      layout.height = 20
      layout.alignSelf = .center
    })
    
    locationLabel.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 1
      layout.marginLeft = 34
      layout.flexGrow = 1
    })
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    [
      iconImageView,
      locationLabel
      ].forEach { locationContainer.addSubview($0) }
    
    [
      locationContainer
      ].forEach { contentView.addSubview($0) }
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
    
    // Сделать стиль для UIImageView
    iconImageView.image = UIImage.Spinners.base
    iconImageView.tintColor = ThemeManager.current().colors.primary500
    
    locationLabel.setStyles(
      UILabel.Styles.headline,
      UILabel.ColorStyle.primary500,
      UILabel.Styles.singleLine
    )
    
    locationLabel.styledText = Localized.locating
    
    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAction)))
  }
  
  @objc private func handleTapAction() {
    output?.didTap(in: self)
  }
}

extension LocationCell: LocationCellInput {}

extension LocationCell {
  enum Localized {
    static let locating = "Определяем местоположение"
  }
}
