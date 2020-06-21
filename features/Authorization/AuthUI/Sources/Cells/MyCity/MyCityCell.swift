//
//  MyCityCell.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import YogaKit
import EsoftUIKit
import ThemeManager
import AnimateUI

public final class MyCityCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "MyCityCellID"
  
  public var myCityName: String? {
      get {
        myCityLabel.text
      }
      set {
        myCityLabel.styledText = newValue
        myCityLabel.yoga.markDirty()
      }
    }
  public var isLocating: Bool = false {
    didSet {
      if isLocating {
        iconImageView.image = UIImage.Spinner.base
        AnimateUI.animate(iconImageView, duration: 1, options: [.repeat(.infinity)]) {
          $0.transform(CGAffineTransform(rotationAngle: CGFloat(Double.pi)))
        }.chain {
          $0.transform(CGAffineTransform(rotationAngle: CGFloat(Double.pi)))
        }
      } else {
        iconImageView.image = UIImage.Geo.base
      }
      iconImageView.yoga.markDirty()
    }
  }

  private(set) lazy var myCityContainer: UIView = UIView()
  private(set) lazy var iconImageView: UIImageView = UIImageView()
  private(set) lazy var myCityLabel: UILabel = UILabel()
  
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
//    myCityName = ""
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = contentView.bounds.size
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    myCityContainer.configureLayout(block: { layout in
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
    
    myCityLabel.configureLayout(block: { layout in
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
      myCityLabel
      ].forEach { myCityContainer.addSubview($0) }
    
    [
      myCityContainer
      ].forEach { contentView.addSubview($0) }
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
    
    // Сделать стиль для UIImageView
    iconImageView.image = UIImage.Geo.base
    iconImageView.tintColor = ThemeManager.current().colors.primary500
    
    myCityLabel.setStyles(
      UILabel.Styles.headline,
      UILabel.ColorStyle.primary500,
      UILabel.Styles.singleLine
    )
  }
}

extension MyCityCell: MyCityCellInput {}
