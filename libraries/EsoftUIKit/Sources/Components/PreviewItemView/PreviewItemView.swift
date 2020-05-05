//
//  PreviewItemView.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 21.04.2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager

public final class PreviewItemView: View {
  
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
  private(set) lazy var topViewStack = UIStackView()
  private(set) lazy var currentPriceLabel = UILabel()
  private(set) lazy var priceStack = UIStackView()
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
    let subviews: [UIView] = [
      topView,
      topViewStack,
      currentPriceLabel,
      priceStack,
      priceImage,
      priceLabel,
      addressLabel,
      mainView,
      image,
      favoriteButton
    ]
    
    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    topView.addSubview(topViewStack)
    topViewStack.addArrangedSubview(currentPriceLabel)
    topViewStack.addArrangedSubview(priceStack)
    priceStack.addArrangedSubview(priceImage)
    priceStack.addArrangedSubview(priceLabel)
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
    
    priceStack.alignment = .center
    priceStack.spacing = 3
    
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
    
    activeConstraints = [
      topView.topAnchor.constraint(equalTo: topAnchor),
      topView.leadingAnchor.constraint(equalTo: leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      topViewStack.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12),
      topViewStack.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
      topViewStack.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
      
      priceImage.widthAnchor.constraint(equalToConstant: 10),
      priceImage.heightAnchor.constraint(equalToConstant: 10.5),
      
      addressLabel.topAnchor.constraint(equalTo: topViewStack.bottomAnchor, constant: 2),
      addressLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
      addressLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
      addressLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8),
      
      // mainView
      
      mainView.topAnchor.constraint(equalTo: topView.bottomAnchor),
      mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
      mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
      mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      image.topAnchor.constraint(equalTo: mainView.topAnchor),
      image.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
      image.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
      image.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
      image.heightAnchor.constraint(equalToConstant: 207),
      
      favoriteButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 13),
      favoriteButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -28.5),
      favoriteButton.heightAnchor.constraint(equalToConstant: 23),
      favoriteButton.widthAnchor.constraint(equalToConstant: 21.95)
    ]
    
    NSLayoutConstraint.activate(activeConstraints)
  }
  
}

extension PreviewItemView: PreviewItemViewInput {}
