//
//  CostItemViewYoga.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 26/04/2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager
import YogaKit

public final class CostItemViewYoga: View {
  public var subheader: String {
    get {
      costSubheader.styledText ?? ""
    }
    set {
      costSubheader.styledText = newValue
    }
  }
  
  public var firstTitle: String {
    get {
      costLabel.styledText ?? ""
    }
    set {
      costLabel.styledText = newValue
    }
  }
  
  public var secondTitle: String {
    get {
      noticeLabel.styledText ?? ""
    }
    set {
      noticeLabel.styledText = newValue
    }
  }
  
  public var icon: UIImage? {
    get {
      editIcon.image
    }
    set {
      editIcon.image = newValue ?? UIImage()
    }
  }
  
  public var thirdTitle: String {
    get {
      editLabel.styledText ?? ""
    }
    set {
      editLabel.styledText = newValue
    }
  }
  
  private(set) lazy var mainContainer: UIView = UIView()
  private(set) lazy var costSubheader: UILabel = UILabel()
  private(set) lazy var costContainer: UIView = UIView()
  private(set) lazy var costStackView: UIView = UIView()
  private(set) lazy var costLabel: UILabel = UILabel()
  private(set) lazy var noticeLabel: UILabel = UILabel()
  private(set) lazy var divider: UIView = UIView()
  private(set) lazy var editStackView: UIView = UIView()
  private(set) lazy var editIcon: UIImageView = UIImageView()
  private(set) lazy var editLabel: UILabel = UILabel()

  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    mainContainer.addSubview(costSubheader)
    mainContainer.addSubview(costContainer)
    
    costContainer.addSubview(costStackView)
    costContainer.addSubview(divider)
    costContainer.addSubview(editStackView)
    
    costStackView.addSubview(costLabel)
    costStackView.addSubview(noticeLabel)
    
    editStackView.addSubview(editIcon)
    editStackView.addSubview(editLabel)
    
    addSubview <^> [
      mainContainer
    ]
  }
  
  private func configureUI() {
    costSubheader.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.secondary
    )
    
    costContainer.backgroundColor = ThemeManager.current().colors.container

    divider.backgroundColor = ThemeManager.current().colors.screen
    
    costLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    noticeLabel.setStyles(UILabel.Styles.microNormal, UILabel.ColorStyle.error)
    
    editIcon.image = UIImage.Screen5.edit
    editIcon.tintColor = ThemeManager.current().colors.primary500
    
    editLabel.setStyles(UILabel.Styles.headline, UILabel.ColorStyle.primary500)
  }
  
  private func layout() {
    mainContainer.configureLayout { layout in
      layout.isEnabled = true
    }
    
    costSubheader.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 16
    }
    
    costContainer.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
      layout.paddingLeft = 16
      layout.paddingRight = 16
      layout.marginTop = 8
    }
    
    costStackView.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.justifyContent = .spaceBetween
    }
    
    divider.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 1
      layout.width = 100%
      layout.paddingLeft = 16
      layout.paddingRight = 16
    }
    
    editStackView.configureLayout { layout in
      layout.isEnabled = true
      layout.position = .relative
      layout.flexDirection = .row
      layout.justifyContent = .flexStart
    }
    
    costLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 13
      layout.marginBottom = 13
    }
    
    noticeLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    editIcon.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 15.43
      layout.marginBottom = 15.43
      layout.width = 17.14
      layout.height = 17.14
      layout.marginRight = 35.43
    }
    
    editLabel.configureLayout { layout in
      layout.isEnabled = true
    }
  }
}

extension CostItemViewYoga: CostItemViewYogaInput {}
