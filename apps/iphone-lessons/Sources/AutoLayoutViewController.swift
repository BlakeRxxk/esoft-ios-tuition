//
//  AutoLayoutViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import ThemeManager

final class AutoLayoutViewController: UIViewController {
  private(set) lazy var container: UIView = UIView()
  
  private(set) lazy var avatarContainer: UIView = UIView()
  private(set) lazy var avatarLabel: UILabel = UILabel()
  
  private(set) lazy var nameContainer: UIStackView = UIStackView()
  private(set) lazy var fullName: UILabel = UILabel()
  private(set) lazy var position: UILabel = UILabel()
  
  private(set) lazy var divider: UIView = UIView()
  
  private(set) lazy var phoneContainer: UIStackView = UIStackView()
  private(set) lazy var phoneIcon: UIImageView = UIImageView()
  private(set) lazy var phone: UILabel = UILabel()
  
  override func loadView() {
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    view.addSubview(container)
    
    nameContainer.addArrangedSubview(fullName)
    nameContainer.addArrangedSubview(position)
    
    phoneContainer.addArrangedSubview(phoneIcon)
    phoneContainer.addArrangedSubview(phone)
    
    avatarContainer.addSubview(avatarLabel)
    container.addSubview(avatarContainer)
    
    container.addSubview(nameContainer)
    container.addSubview(divider)
    container.addSubview(phoneContainer)
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    
    nameContainer.axis = .vertical
    nameContainer.isLayoutMarginsRelativeArrangement = true
    nameContainer.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 16)

    avatarContainer.backgroundColor = ThemeManager.current().colors.stub
    avatarContainer.layer.cornerRadius = 24.0
    avatarContainer.clipsToBounds = true

    avatarLabel.textColor = ThemeManager.current().textColors.white
    avatarLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    let avatarLabelStyle = NSMutableParagraphStyle()
    avatarLabelStyle.lineHeightMultiple = 1.01

    avatarLabel.textAlignment = .center
    avatarLabel.attributedText = NSMutableAttributedString(string: Localized.avatarLabel,
                                                           attributes: [
                                                            NSAttributedString.Key.kern: 0.34,
                                                            NSAttributedString.Key.paragraphStyle: avatarLabelStyle])
    
    fullName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    fullName.lineBreakMode = .byWordWrapping
    fullName.textColor = ThemeManager.current().textColors.primary
    fullName.numberOfLines = 0
    let fullNameStyle = NSMutableParagraphStyle()
    
    fullNameStyle.lineHeightMultiple = 1.08
    fullName.attributedText = NSMutableAttributedString(string: Localized.name,
                                                        attributes: [
                                                          NSAttributedString.Key.kern: -0.41,
                                                          NSAttributedString.Key.paragraphStyle: fullNameStyle])
    
    position.font = UIFont.systemFont(ofSize: 15)
    position.textColor = ThemeManager.current().textColors.secondary
    position.numberOfLines = 1
    let positionStyle = NSMutableParagraphStyle()
    
    positionStyle.lineHeightMultiple = 1.12
    position.attributedText = NSMutableAttributedString(string: Localized.position,
                                                        attributes: [
                                                          NSAttributedString.Key.kern: -0.24,
                                                          NSAttributedString.Key.paragraphStyle: positionStyle])

    divider.backgroundColor = ThemeManager.current().colors.divider
    
    phoneIcon.image = UIImage.Call.right
    
    phoneIcon.tintColor = ThemeManager.current().colors.primary500
    phoneContainer.alignment = .center
    phoneContainer.axis = .horizontal
    phoneContainer.spacing = 32.0
    phoneContainer.isLayoutMarginsRelativeArrangement = true
    phoneContainer.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    phone.textColor = ThemeManager.current().colors.primary500
    phone.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineHeightMultiple = 1.08
    
    phone.attributedText = NSMutableAttributedString(string: Localized.phone,
                                                     attributes: [
                                                      NSAttributedString.Key.kern: -0.41,
                                                      NSAttributedString.Key.paragraphStyle: paragraphStyle])
    
  }
  
  private func layout() {
    [
      container,
      avatarContainer,
      avatarLabel,
      nameContainer,
      fullName,
      position,
      divider,
      phoneContainer,
      phoneIcon,
      phone
      ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    let constraints = [
      container.topAnchor.constraint(equalTo: view.topAnchor),
      container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      avatarContainer.heightAnchor.constraint(equalToConstant: 48.0),
      avatarContainer.widthAnchor.constraint(equalToConstant: 48.0),
      avatarContainer.topAnchor.constraint(equalTo: container.topAnchor, constant: 16.0),
      avatarContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16.0),
      
      avatarLabel.centerYAnchor.constraint(equalTo: avatarContainer.centerYAnchor),
      avatarLabel.centerXAnchor.constraint(equalTo: avatarContainer.centerXAnchor),
      
      nameContainer.topAnchor.constraint(equalTo: container.topAnchor, constant: 8.0),
      nameContainer.leadingAnchor.constraint(equalTo: avatarContainer.trailingAnchor, constant: 8.0),
      nameContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      
      divider.heightAnchor.constraint(equalToConstant: 1.0),
      divider.topAnchor.constraint(equalTo: nameContainer.bottomAnchor),
      divider.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16.0),
      divider.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16.0),
      
      phoneContainer.topAnchor.constraint(equalTo: divider.bottomAnchor),
      phoneContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      phoneContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      phoneContainer.heightAnchor.constraint(equalToConstant: 48.0),
      
      phoneIcon.heightAnchor.constraint(equalToConstant: 24.0),
      phoneIcon.widthAnchor.constraint(equalToConstant: 24.0)

    ]
    
    NSLayoutConstraint.activate(constraints)
  }
}

private extension AutoLayoutViewController {
  enum Localized {
    static let position = "Персональный менеджер"
    static let name = "Константинов Константин Константинович"
    static let avatarLabel = "КК"
    static let phone = "+7 999 999 99 99"
  }
}
