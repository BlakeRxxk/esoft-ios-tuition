//
//  PreviewItemViewYOGA.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 23.04.2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager

public final class PreviewItemViewYOGA: View {
  
  public var currentPrice: String {
    get {
      currentPriceLabel.styledText ?? ""
    }
    set {
      currentPriceLabel.styledText = newValue
    }
  }

  public var price: String {
    get {
      priceLabel.styledText ?? ""
    }
    set {
      priceLabel.styledText = newValue
    }
  }

  public var address: String {
    get {
      addressLabel.styledText ?? ""
    }
    set {
      addressLabel.styledText = newValue
    }
  }

  public var photo: UIImage? {
    get {
      image.image
    }
    set {
      image.image = newValue
    }
  }
  
  // topView
  private(set) lazy var topView = UIView()
  private(set) lazy var topViewStack = UIView()
  private(set) lazy var currentPriceLabel = UILabel()
  private(set) lazy var priceStack = UIView()
  private(set) lazy var priceImage = UIImageView()
  private(set) lazy var priceLabel = UILabel()
  private(set) lazy var addressLabel = UILabel()
  
  // mainView
  private(set) lazy var mainView = UIView()
  private(set) lazy var image = UIImageView()
  private(set) lazy var favoriteButton = UIButton()
  
  private var activeConstraints: [NSLayoutConstraint] = []
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    topView.addSubview(topViewStack)
    topViewStack.addSubview(currentPriceLabel)
    topViewStack.addSubview(priceStack)
    priceStack.addSubview(priceImage)
    priceStack.addSubview(priceLabel)
    topView.addSubview(addressLabel)
    
    mainView.addSubview(image)
    mainView.addSubview(favoriteButton)
    
    addSubview <^> [
      topView,
      mainView
    ]
  }
  
  private func configureUI() {
    
    priceImage.image = UIImage.arrowDown
    priceImage.tintColor = ThemeManager.current().colors.primary500
    
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    image.backgroundColor = .gray
    
    favoriteButton.setBackgroundImage(UIImage.favorit, for: .normal)
    favoriteButton.tintColor = ThemeManager.current().colors.container
    
    addressLabel.numberOfLines = 0
    
    currentPriceLabel.setStyles(
      UILabel.Styles.title3
    )
    
    currentPriceLabel.setStyles(
      UILabel.Styles.title3
    )
    
    priceLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.strikeThrough,
      UILabel.ColorStyle.placeholders
    )
    
    addressLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.secondary
    )
  }
  
  private func layout() {
    
    configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
    }
    
    topView.configureLayout { layout in
      layout.isEnabled = true
      layout.paddingTop = 12
      layout.paddingBottom = 8
    }
    
    topViewStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.justifyContent = .spaceBetween
      layout.marginBottom = 2
    }
    
    currentPriceLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    priceStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.alignItems = .center
    }
    
    priceImage.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 10
      layout.height = 10.5
      layout.marginRight = 3
    }
    
    priceLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    addressLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    mainView.configureLayout { layout in
      layout.isEnabled = true
      layout.position = .relative
    }
    
    image.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 207
    }
    
    favoriteButton.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 23
      layout.height = 21.95
      layout.position = .absolute
      layout.top = 13
      layout.right = 12.5
    }
    
  }
  
}

extension PreviewItemViewYOGA: PreviewItemViewInputYOGA {}
