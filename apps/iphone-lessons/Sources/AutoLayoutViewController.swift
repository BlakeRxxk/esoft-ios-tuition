//
//  AutoLayoutViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit

final class AutoLayoutViewController: UIViewController {
  private(set) lazy var container: UIView = UIView()
  
  private(set) lazy var avatarContainer: UIView = UIView()
  
  private(set) lazy var nameContainer: UIView = UIView()
  private(set) lazy var fullName: UILabel = UILabel()
  private(set) lazy var position: UILabel = UILabel()
  
  private(set) lazy var divider: UIView = UIView()
  
  private(set) lazy var phoneContainer: UIView = UIView()
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
    
    nameContainer.addSubview(fullName)
    nameContainer.addSubview(position)
    
    phoneContainer.addSubview(phone)
    
    container.addSubview(avatarContainer)
    
    container.addSubview(nameContainer)
    container.addSubview(divider)
    container.addSubview(phoneContainer)
  }
  
  private func configureUI() {
    view.backgroundColor = .white

    avatarContainer.backgroundColor = .gray
    avatarContainer.layer.cornerRadius = 24.0
    avatarContainer.clipsToBounds = true
    
    fullName.font = UIFont(name: "SFProText-Semibold", size: 17)
    fullName.lineBreakMode = .byWordWrapping
    fullName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
    fullName.numberOfLines = 0
    let fullNameStyle = NSMutableParagraphStyle()
    
    fullNameStyle.lineHeightMultiple = 1.08
    fullName.attributedText = NSMutableAttributedString(string: Localized.name,
                                                        attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: fullNameStyle])
    
    position.font = UIFont.systemFont(ofSize: 15)
    position.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.38)
    position.numberOfLines = 1
    let positionStyle = NSMutableParagraphStyle()
    
    positionStyle.lineHeightMultiple = 1.12
    position.attributedText = NSMutableAttributedString(string: Localized.position,
                                                        attributes: [NSAttributedString.Key.kern: -0.24, NSAttributedString.Key.paragraphStyle: positionStyle])
    divider.backgroundColor = .systemGray
  }
  
  private func layout() {
    [
      container,
      avatarContainer,
      nameContainer,
      fullName,
      position,
      divider,
      phoneContainer,
      phone
      ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    
    var containerConstraints: NSLayoutConstraint = container.topAnchor.constraint(equalTo: view.topAnchor)
    if #available(iOS 11.0, *) {
      containerConstraints = container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    }
    
    let constraints = [
      containerConstraints,
      container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      avatarContainer.heightAnchor.constraint(equalToConstant: 48.0),
      avatarContainer.widthAnchor.constraint(equalToConstant: 48.0),
      avatarContainer.topAnchor.constraint(equalTo: container.topAnchor, constant: 16.0),
      avatarContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16.0),
      nameContainer.topAnchor.constraint(equalTo: container.topAnchor, constant: 8.0),
      nameContainer.heightAnchor.constraint(equalToConstant: 80.0),
      nameContainer.leadingAnchor.constraint(equalTo: avatarContainer.trailingAnchor, constant: 8.0),
      nameContainer.trailingAnchor.constraint(equalTo: container.layoutMarginsGuide.trailingAnchor),
      fullName.trailingAnchor.constraint(equalTo: nameContainer.trailingAnchor, constant: -16.0),
      fullName.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor),
      fullName.topAnchor.constraint(lessThanOrEqualTo: container.topAnchor, constant: 8.0),
      position.topAnchor.constraint(equalTo: fullName.bottomAnchor),
      
      divider.heightAnchor.constraint(equalToConstant: 1.0),
      divider.topAnchor.constraint(equalTo: nameContainer.bottomAnchor, constant: 16.0),
      divider.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16.0),
      divider.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16.0)
    ]

    NSLayoutConstraint.activate(constraints)
  }
}

private extension AutoLayoutViewController {
  enum Localized {
    static let position = "Персональный менеджер"
    static let name = "Константинов Константин Константинович"
  }
}
