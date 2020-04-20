//
//  InfoView.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 19.04.2020.
//

import UIKit
import BaseUI
import ThemeManager

public final class InfoItemView: View {
  
  public var firstIcon: UIImage? {
    get {
      viewsImage.image
    }
    set {
      viewsImage.image = newValue ?? UIImage()
    }
  }
  
  public var firstTitle: String {
    get {
      viewsCount.styledText ?? ""
    }
    set {
      viewsCount.styledText = newValue
    }
  }
  
  public var secondIcon: UIImage? {
    get {
      favoriteImage.image
    }
    set {
      favoriteImage.image = newValue ?? UIImage()
    }
  }
  
  public var secondTitle: String {
    get {
      favoriteCount.styledText ?? ""
    }
    set {
      favoriteCount.styledText = newValue
    }
  }
  
  public var thirdTitle: String {
    get {
      codeObject.styledText ?? ""
    }
    set {
      codeObject.styledText = newValue
    }
  }
  
  // INFO STACK
  private(set) lazy var infoStack:      UIStackView = UIStackView()
  private(set) lazy var viewsView:      UIStackView = UIStackView()
  private(set) lazy var viewsImage:     UIImageView = UIImageView ()
  private(set) lazy var viewsCount:     UILabel     = UILabel()
  private(set) lazy var favoriteView:   UIStackView = UIStackView()
  private(set) lazy var favoriteImage:  UIImageView = UIImageView()
  private(set) lazy var favoriteCount:  UILabel     = UILabel()
  private(set) lazy var codeObject:     UILabel     = UILabel()
  
  private var activeConstraints: [NSLayoutConstraint] = []
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    
    let subviews: [UIView] = [
      infoStack,
      viewsView,
      viewsImage,
      viewsCount,
      favoriteView,
      favoriteImage,
      favoriteCount,
      codeObject
    ]
    
    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    infoStack.addArrangedSubview(viewsView)
    viewsView.addArrangedSubview(viewsImage)
    viewsView.addArrangedSubview(viewsCount)
    
    infoStack.addArrangedSubview(favoriteView)
    favoriteView.addArrangedSubview(favoriteImage)
    favoriteView.addArrangedSubview(favoriteCount)
    
    infoStack.addArrangedSubview(codeObject)
    
    addSubview(infoStack)
  }
  
  private func configureUI() {
    
    viewsImage.image = UIImage.eye
    viewsImage.tintColor = ThemeManager.current().textColors.secondary
    favoriteImage.image = UIImage.starSmall
    favoriteImage.tintColor = ThemeManager.current().textColors.secondary
    
    infoStack.alignment = .center
    infoStack.distribution = .equalCentering
    infoStack.axis = .horizontal
    
    viewsView.alignment = .center
    viewsView.spacing = 5
    
    favoriteView.alignment = .center
    favoriteView.spacing = 5
    
//    viewsCount.font = UIFont.systemFont(ofSize: 10)
//    favoriteCount.font = UIFont.systemFont(ofSize: 10)
//    codeObject.font = UIFont.systemFont(ofSize: 10)
    
    
    viewsCount.setStyles(
      UILabel.Styles.micro,
      UILabel.ColorStyle.placeholders
    )
    
    favoriteCount.setStyles(
      UILabel.Styles.micro,
      UILabel.ColorStyle.placeholders
    )
    
    codeObject.setStyles(
      UILabel.Styles.micro,
      UILabel.ColorStyle.placeholders
    )
    
  }
  
  private func layout() {
    activeConstraints = [
      
      infoStack.topAnchor.constraint(equalTo: topAnchor),
      infoStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      infoStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      infoStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      favoriteView.leadingAnchor.constraint(equalTo: viewsView.trailingAnchor, constant: 22),
      
      viewsImage.widthAnchor.constraint(equalToConstant: 11),
      viewsImage.heightAnchor.constraint(equalToConstant: 7.5),
      
      favoriteImage.widthAnchor.constraint(equalToConstant: 10),
      favoriteImage.heightAnchor.constraint(equalToConstant: 9.41)
    ]
    
    NSLayoutConstraint.activate(activeConstraints)
  }
  
}

extension InfoItemView: InfoItemViewInput {}
