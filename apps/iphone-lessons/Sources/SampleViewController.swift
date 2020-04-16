//
//  SampleViewController.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 15.04.2020.
//

import UIKit
import EsoftUIKit
import ThemeManager

final class SampleViewController: UIViewController {
  private(set) lazy var container: UIView = UIView()
  
  private(set) lazy var avatarContainer: UIView = UIView()
  private(set) lazy var avatarLabel: UILabel = UILabel()
  
  private(set) lazy var fioStack: UIStackView = UIStackView()
  
  private(set) lazy var nameLabel: UILabel = UILabel()

  private(set) lazy var positionLabel: UILabel = UILabel()
  
  private(set) lazy var divider: UIView = UIView()
  
  private(set) lazy var phoneStack: UIStackView = UIStackView()
  private(set) lazy var phoneIcon: UIImageView = UIImageView()
  private(set) lazy var phoneLabel: UILabel = UILabel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    fioStack.addArrangedSubview(nameLabel)
    fioStack.addArrangedSubview(positionLabel)
    
    phoneStack.addArrangedSubview(phoneIcon)
    phoneStack.addArrangedSubview(phoneLabel)
    
    avatarContainer.addSubview(avatarLabel)

    container.addSubview(avatarContainer)
    container.addSubview(fioStack)
    container.addSubview(divider)
    container.addSubview(phoneStack)
    
    view.addSubview(container)
  }
  
  private func configureUI() {
    view.backgroundColor = .white
    
    phoneLabel.text = Localization.phone
    phoneLabel.textColor = ThemeManager.current().colors.primary500
  
    nameLabel.text = Localization.name
    nameLabel.textColor = ThemeManager.current().textColors.primary
  
    positionLabel.text = Localization.position
    positionLabel.textColor = ThemeManager.current().textColors.secondary
    
    avatarLabel.text = Localization.avatarStub
    avatarLabel.textColor = ThemeManager.current().textColors.white
    
    fioStack.axis = .vertical
    fioStack.isLayoutMarginsRelativeArrangement = true
    fioStack.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 16)
    
    phoneIcon.image = UIImage.Call.left
    phoneIcon.tintColor = ThemeManager.current().colors.primary500
    
    phoneStack.axis = .horizontal
    phoneStack.spacing = 32.0
    phoneStack.isLayoutMarginsRelativeArrangement = true
    phoneStack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  }

  private func layout() {
    [
      container,
      avatarContainer,
      avatarLabel,
      fioStack,
      nameLabel,
      positionLabel,
      divider,
      phoneStack,
      phoneIcon,
      phoneLabel
      ].forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    let constraints = [
      container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      container.topAnchor.constraint(equalTo: view.topAnchor),
      
      fioStack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      fioStack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      fioStack.topAnchor.constraint(equalTo: container.topAnchor),
      
      phoneStack.topAnchor.constraint(equalTo: fioStack.bottomAnchor, constant: 16),
      phoneStack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      phoneStack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
}

private extension SampleViewController {
  enum Localization {
    static let name: String = "Норкин Константин Владимирович"
    static let position: String = "Персональный менеджер"
    static let phone: String = "+7 999 999 99 99"
    static let avatarStub: String = "НК"
  }
}
