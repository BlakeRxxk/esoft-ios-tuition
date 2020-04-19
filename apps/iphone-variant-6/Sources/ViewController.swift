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
  private(set) lazy var titleView: UIView = UIView()
  private(set) lazy var logoImageView: UIImageView = UIImageView()
  private(set) lazy var closeImageView: UIImageView = UIImageView()
  
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
  
  private func createUI() {
    navigationItem.titleView = titleView
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeImageView)
    
    titleView.addSubview(logoImageView)
    
    view.addSubview(container)
    
    container.addSubview(enterLabel)
    container.addSubview(phoneTextField)
    container.addSubview(phoneTextField)
    container.addSubview(divider)
    container.addSubview(continueButton)
    container.addSubview(socialStackView)
    
    socialStackView.addArrangedSubview(facebookImageView)
    socialStackView.addArrangedSubview(vkImageView)
    socialStackView.addArrangedSubview(okImageView)
    socialStackView.addArrangedSubview(googleImageView)
    
    container.addSubview(termLabel)
  }
  
  private func configureUI() {
    logoImageView.image = UIImage(named: "logo")
    closeImageView.image = UIImage(named: "closeIcon")
    
    view.backgroundColor = ThemeManager.current().colors.container
    
    enterLabel.setStyles(UILabel.ColorStyle.primary)
    enterLabel.styledText = Localized.enterLabel
    
    phoneTextField.attributedPlaceholder = NSAttributedString(string: Localized.phonePlaceholder,
                                                              attributes: [
                                                                NSAttributedString.Key.foregroundColor: ThemeManager.current().textColors.placeholder])
    phoneTextField.placeholder = Localized.phonePlaceholder
    
    divider.backgroundColor = ThemeManager.current().colors.divider
    
    let redColor = UIColor(red: 235.0 / 255.0, green: 90.0 / 255.0, blue: 70.0 / 255.0, alpha: 1.0)
    continueButton.backgroundColor = redColor
    continueButton.layer.cornerRadius = 22.0
    continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
    continueButton.setTitle(Localized.continueButton, for: .normal)
    
    socialStackView.spacing = 48.0
    socialStackView.distribution = .equalSpacing
    socialStackView.axis = .horizontal
    facebookImageView.image = UIImage(named: "facebookIcon")
    vkImageView.image = UIImage(named: "vkIcon")
    okImageView.image = UIImage(named: "okIcon")
    googleImageView.image = UIImage(named: "googleIcon")
    
    termLabel.setStyles(UILabel.Styles.doubleLine,
                        UILabel.Styles.tiny,
                        UILabel.Styles.alignCenter,
                        UILabel.ColorStyle.primary)
    let style = NSMutableParagraphStyle()
    style.alignment = .center
    let str = NSMutableAttributedString(string: Localized.termOfUse,
                                        attributes: [NSAttributedString.Key.paragraphStyle: style,
                                                     NSAttributedString.Key.font: UIFont.tiny])
    str.addAttribute(NSAttributedString.Key.foregroundColor, value: redColor, range: NSRange(location: 31, length: 30))
    termLabel.attributedText = str
  }
  
  private func layout() {
    [
      titleView,
      logoImageView,
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
      logoImageView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor, constant: -4),
      
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
      // Я бы сделал space around, но это не флексы
      socialStackView.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor, constant: 18.0),
      socialStackView.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor, constant: -18.0),
      
//      facebookImageView.widthAnchor.constraint(equalToConstant: 32.0),
//      vkImageView.widthAnchor.constraint(equalToConstant: 32.0),
//      okImageView.widthAnchor.constraint(equalToConstant: 32.0),
//      googleImageView.widthAnchor.constraint(equalToConstant: 32.0),
      
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
