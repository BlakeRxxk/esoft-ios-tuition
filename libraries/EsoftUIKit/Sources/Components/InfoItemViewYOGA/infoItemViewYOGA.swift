//
//  InfoView.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 19.04.2020.
//

import UIKit
import BaseUI
import ThemeManager
import YogaKit

public final class InfoItemViewYOGA: View {
  
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
  private(set) lazy var infoStack: UIView = UIView()
  private(set) lazy var viewsView: UIView = UIView()
  private(set) lazy var countsWrapped: UIView = UIView()
  private(set) lazy var viewsImage: UIImageView = UIImageView()
  private(set) lazy var viewsCount: UILabel = UILabel()
  private(set) lazy var favoriteView: UIView = UIView()
  private(set) lazy var favoriteImage: UIImageView = UIImageView()
  private(set) lazy var favoriteCount: UILabel = UILabel()
  private(set) lazy var codeObject: UILabel = UILabel()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    
    addSubview(infoStack)
    
    infoStack.addSubview(viewsView)
    infoStack.addSubview(countsWrapped)
    
    countsWrapped.addSubview(viewsView)
    countsWrapped.addSubview(favoriteView)
    
    infoStack.addSubview(codeObject)

    viewsView.addSubview(viewsImage)
    viewsView.addSubview(viewsCount)

    favoriteView.addSubview(favoriteImage)
    favoriteView.addSubview(favoriteCount)
  }
  
  private func configureUI() {
    
    viewsImage.image = UIImage.eye
    viewsImage.tintColor = ThemeManager.current().textColors.secondary
    favoriteImage.image = UIImage.starSmall
    favoriteImage.tintColor = ThemeManager.current().textColors.secondary
    
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
    
    infoStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.paddingTop = 4
      layout.paddingBottom = 8
      layout.alignItems = .center
      layout.justifyContent = .spaceBetween
    }
    
    countsWrapped.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
    }
    
    viewsView.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
    }
    
    viewsImage.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 11
      layout.height = 7.5
    }
    
    viewsCount.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 5
    }
    
    favoriteView.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 22
      layout.flexDirection = .row
    }
    
    favoriteImage.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 10
      layout.height = 9.41
    }
    
    favoriteCount.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 5
    }
    
    codeObject.configureLayout { (layout) in
      layout.isEnabled = true
    }
    
  }
  
}

extension InfoItemViewYOGA: InfoItemViewInputYOGA {}
