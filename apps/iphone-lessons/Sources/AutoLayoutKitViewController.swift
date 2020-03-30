//
//  AutoLayoutKitViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import AutoLayoutKit
import BaseFRP

final class AutoLayoutKitViewController: UIViewController {
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
    view.addSubview <^> [container]
    
    nameContainer.addSubview <^> [
      fullName,
      position
    ]
    
    phoneContainer.addSubview <^> [
      phone
    ]
    
    container.addSubview <^> [
      avatarContainer,
      nameContainer,
      divider,
      phoneContainer
    ]
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
    
    var containerConstraints: NSLayoutConstraint = container.top.constraint(equalTo: view.top)
    if #available(iOS 11.0, *) {
      containerConstraints = container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    }
    
    let constraints = [
      containerConstraints,
      container.leading.constraint(equalTo: view.leading),
      container.trailing.constraint(equalTo: view.trailing),
      avatarContainer.height.constraint(equalToConstant: 48.0),
      avatarContainer.width.constraint(equalToConstant: 48.0),
      avatarContainer.top.constraint(equalTo: container.top, constant: 16.0),
      avatarContainer.leading.constraint(equalTo: container.leading, constant: 16.0),
      nameContainer.top.constraint(equalTo: container.top, constant: 8.0),
      nameContainer.height.constraint(equalToConstant: 80.0),
      nameContainer.leading.constraint(equalTo: avatarContainer.trailing, constant: 8.0),
      nameContainer.trailing.constraint(equalTo: container.trailing),
      fullName.trailing.constraint(equalTo: nameContainer.trailing, constant: -16.0),
      fullName.leading.constraint(equalTo: nameContainer.leading),
      fullName.top.constraint(lessThanOrEqualTo: container.top, constant: 8.0),
      position.top.constraint(equalTo: fullName.bottom),
      
      divider.height.constraint(equalToConstant: 1.0),
      divider.top.constraint(equalTo: nameContainer.bottom, constant: 16.0),
      divider.leading.constraint(equalTo: container.leading, constant: 16.0),
      divider.trailing.constraint(equalTo: container.trailing, constant: -16.0),
    ]

    NSLayoutConstraint.activate(constraints)
  }
}

private extension AutoLayoutKitViewController {
  enum Localized {
    static let position = "Персональный менеджер"
    static let name = "Константинов Константин Константинович"
  }
}
