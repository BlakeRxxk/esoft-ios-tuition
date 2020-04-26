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

final class ViewController: UIViewController {
  private(set) lazy var container: UIView = UIView()
  
  private(set) lazy var enterLabel: UILabel = UILabel()
  
  private(set) lazy var phoneTextField: UITextField = UITextField()
  private(set) lazy var divider: UIView = UIView()
  
  private(set) lazy var continueButton: UIButton = UIButton()
  
  private(set) lazy var socialStackView: UIStackView = UIStackView()
  
  private(set) lazy var facebookImageView: UIImageView = UIImageView()
  private(set) lazy var vkImageView: UIImageView = UIImageView()
  private(set) lazy var okImageView: UIImageView = UIImageView()
  private(set) lazy var googleImageView: UIImageView = UIImageView()
  
  private(set) lazy var termLabel: UILabel = UILabel()
  
  override func loadView() {
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    layout()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.setStyles(UINavigationItem.Styles.logo)
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.auth)
    addCloseButtonIfNeeded(target: self)
    
    let constraints = [
      navigationItem.titleView!.superview!.centerYAnchor.constraint(equalTo: navigationController!.navigationBar.centerYAnchor, constant: -4.0)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
  
  private func createUI() {
    view.addSubview(container)
    
    [
      enterLabel,
      phoneTextField,
      divider,
      continueButton,
      socialStackView,
      termLabel
      ].forEach { container.addSubview($0) }
    
    [
      facebookImageView,
      vkImageView,
      okImageView,
      googleImageView
      ].forEach { socialStackView.addArrangedSubview($0) }
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    
    enterLabel.setStyles(UILabel.ColorStyle.primary)
    enterLabel.styledText = Localized.enterLabel
    
    phoneTextField.attributedPlaceholder = NSAttributedString(string: Localized.phonePlaceholder,
                                                              attributes: [.foregroundColor: ThemeManager.current().textColors.placeholder])
    phoneTextField.placeholder = Localized.phonePlaceholder
    
    divider.backgroundColor = ThemeManager.current().colors.divider
    
    continueButton.backgroundColor = ThemeManager.current().colors.brand
    continueButton.layer.cornerRadius = 22.0
    continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
    continueButton.setTitle(Localized.continueButton, for: .normal)
    
    socialStackView.spacing = 48.0
    socialStackView.distribution = .equalSpacing
    socialStackView.axis = .horizontal
    
    facebookImageView.image = UIImage.Socials.facebook
    vkImageView.image = UIImage.Socials.vk
    okImageView.image = UIImage.Socials.ok
    googleImageView.image = UIImage.Socials.google
    
    termLabel.setStyles(UILabel.Styles.doubleLine,
                        UILabel.Styles.alignCenter,
                        UILabel.Styles.tiny,
                        UILabel.ColorStyle.primary)
    termLabel.styledText = Localized.termOfUse
    let str: NSMutableAttributedString = NSMutableAttributedString.init(attributedString: termLabel.attributedText!)
    str.addAttribute(.foregroundColor, value: ThemeManager.current().colors.brand, range: NSRange(location: 31, length: 30))
    termLabel.attributedText = str
  }
  
  private func layout() {
    [
      container,
      enterLabel,
      phoneTextField,
      divider,
      continueButton,
      socialStackView,
      facebookImageView,
      vkImageView,
      okImageView,
      googleImageView,
      termLabel
      ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    
    let constraints = [
      container.topAnchor.constraint(equalTo: view.topAnchor),
      container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      enterLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      enterLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 44.0),
      
      phoneTextField.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 70.0),
      phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
      phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
      
      divider.heightAnchor.constraint(equalToConstant: 1.0),
      divider.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 21.5),
      divider.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
      divider.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor),
      
      continueButton.heightAnchor.constraint(equalToConstant: 44.0),
      continueButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 48.0),
      continueButton.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
      continueButton.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor),
      
      socialStackView.heightAnchor.constraint(equalToConstant: 32.0),
      socialStackView.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 52.0),
      socialStackView.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor, constant: 18.0),
      socialStackView.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor, constant: -18.0),
      
      termLabel.topAnchor.constraint(equalTo: socialStackView.bottomAnchor, constant: 16.0),
      termLabel.leadingAnchor.constraint(equalTo: socialStackView.leadingAnchor),
      termLabel.trailingAnchor.constraint(equalTo: socialStackView.trailingAnchor)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
}

private extension ViewController {
  enum Localized {
    static let enterLabel = "Вход в личный кабинет"
    static let phonePlaceholder = "Номер телефона"
    static let continueButton = "Продолжить"
    static let termOfUse = "Авторизуясь, вы соглашаетесь с правилами пользования сервисом"
  }
}
