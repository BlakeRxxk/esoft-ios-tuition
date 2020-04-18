//
//  SampleViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Atlas
import UIKit
import EsoftUIKit
import ThemeManager
import AutoLayoutKit

final class SampleViewController: UIViewController {
  private(set) lazy var container: UIView = UIView()
  
  private(set) lazy var avatarContainer: UIView = UIView()
  private(set) lazy var avatarLabel: UILabel = UILabel()
  
  private(set) lazy var nameContainer: UIStackView = UIStackView()
  private(set) lazy var fullName: UILabel = UILabel()
  private(set) lazy var position: UILabel = UILabel()
  
  private(set) lazy var divider: UIView = UIView()
  
  private(set) lazy var phoneView: IconItemView = IconItemView()
  private(set) lazy var chatView: IconItemView = IconItemView()
  
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
    
    avatarContainer.addSubview(avatarLabel)
    container.addSubview(avatarContainer)
    
    container.addSubview(nameContainer)
    container.addSubview(divider)
    container.addSubview(phoneView)
    container.addSubview(chatView)
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    
    nameContainer.axis = .vertical
    nameContainer.isLayoutMarginsRelativeArrangement = true
    nameContainer.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 16)

    avatarContainer.backgroundColor = ThemeManager.current().colors.stub
    avatarContainer.layer.cornerRadius = 24.0
    avatarContainer.clipsToBounds = true

    avatarLabel.setStyles(
      UILabel.Styles.title3,
      UILabel.ColorStyle.inverse
    )
    avatarLabel.styledText = Localized.avatarLabel
    
    fullName.styledText = Localized.name
    fullName.numberOfLines = 0

    position.font = UIFont.systemFont(ofSize: 15)
    position.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.secondary
    )
    position.styledText = Localized.position
    
    divider.backgroundColor = ThemeManager.current().colors.divider
    
    phoneView.leftIcon = UIImage.Call.right
    phoneView.setStyles(IconItemView.Styles.greeny)
    phoneView.title = Localized.phone
    
    chatView.leftIcon = UIImage.Consultant.left
    chatView.setStyles(IconItemView.Styles.normal)

    chatView.title = Localized.chat
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
      phoneView,
      chatView,
      ].forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

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
      
      phoneView.topAnchor.constraint(equalTo: divider.bottomAnchor),
      phoneView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      phoneView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      phoneView.heightAnchor.constraint(equalToConstant: 48.0),

      chatView.top.constraint(equalTo: phoneView.bottom),
      chatView.leading.constraint(equalTo: container.leading),
      chatView.trailing.constraint(equalTo: container.trailing),
      chatView.height.constraint(equalToConstant: Space.large)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
}

private extension SampleViewController {
  enum Localized {
    static let position = "Персональный менеджер"
    static let name = "Константинов Константин Константинович"
    static let avatarLabel = "КК"
    static let phone = "+7 999 999 99 99"
    static let chat = "Чат со специалистом"
  }
}
