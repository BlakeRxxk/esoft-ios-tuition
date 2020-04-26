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
import AutoLayoutKit
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
  
//  private var activeConstraints: [NSLayoutConstraint] = []
  
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
    
//    costStackView.alignment = .center
//    costStackView.isLayoutMarginsRelativeArrangement = true
//    costStackView.layoutMargins = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
    
    divider.backgroundColor = ThemeManager.current().colors.screen
    
    costLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    noticeLabel.setStyles(UILabel.Styles.microNormal, UILabel.ColorStyle.error)
    
    editIcon.image = UIImage.Screen5.edit
    editIcon.tintColor = ThemeManager.current().colors.primary500
    
    editLabel.setStyles(UILabel.Styles.headline, UILabel.ColorStyle.primary500)
    
//    editStackView.alignment = .center
//    editStackView.spacing = 32
//    editStackView.isLayoutMarginsRelativeArrangement = true
//    editStackView.layoutMargins = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
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
    
//    activeConstraints = [
//      mainContainer.top.constraint(equalTo: top),
//      mainContainer.leading.constraint(equalTo: leading),
//      mainContainer.trailing.constraint(equalTo: trailing),
//      mainContainer.bottom.constraint(equalTo: bottom),
//
//      costSubheader.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 20),
//      costSubheader.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 16),
//      costSubheader.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -16),
//
//      costContainer.top.constraint(equalTo: costSubheader.bottom, constant: 8),
//      costContainer.leading.constraint(equalTo: mainContainer.leading),
//      costContainer.trailing.constraint(equalTo: mainContainer.trailing),
//      costContainer.bottom.constraint(equalTo: mainContainer.bottom),
//
//      costStackView.top.constraint(equalTo: costContainer.top),
//      costStackView.leading.constraint(equalTo: costContainer.leading),
//      costStackView.trailing.constraint(equalTo: costContainer.trailing),
//      costStackView.bottom.constraint(equalTo: divider.top),
//
//      noticeLabel.leading.constraint(equalTo: costLabel.trailing),
//
//      divider.leading.constraint(equalTo: costStackView.leading),
//      divider.trailing.constraint(equalTo: costStackView.trailing),
//      divider.heightAnchor.constraint(equalToConstant: 1),
//
//      editStackView.top.constraint(equalTo: divider.bottom),
//      editStackView.leading.constraint(equalTo: costContainer.leading),
//      editStackView.trailing.constraint(equalTo: costContainer.trailing),
//      editStackView.bottom.constraint(equalTo: costContainer.bottom),
//
//      editIcon.height.constraint(equalToConstant: 17.14),
//      editIcon.width.constraint(equalToConstant: 17.14)
//    ]
//
//    NSLayoutConstraint.activate(activeConstraints)
  }
}

extension CostItemViewYoga: CostItemViewYogaInput {}
