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
import YogaKit

final class MyViewController: UIViewController {
  private(set) lazy var container: UIView = UIView()
  
  private(set) lazy var enterLabel: UILabel = UILabel()
  
  private(set) lazy var phoneTextField: UnderscoredTextField = UnderscoredTextField()
  
  private(set) lazy var continueButton: UIButton = UIButton()
  
  private(set) lazy var socialStack: SocialStack = SocialStack()
  
  private(set) lazy var termLabel: UILabel = UILabel()
  
  internal lazy var layout: Layout = Layout()
  
  override func loadView() {
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.setStyles(UINavigationItem.Styles.logo)
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.auth)
    addCloseButtonIfNeeded(target: self)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print("viewDidLayoutSubviews")
    
    view.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    })

    container.configureLayout(block: layout.container)

    enterLabel.configureLayout(block: layout.enterLabel)
    phoneTextField.configureLayout(block: layout.phoneTextField)
    continueButton.configureLayout(block: layout.continueButton)
    socialStack.configureLayout(block: layout.socialStack)
    termLabel.configureLayout(block: layout.termLabel)

    view.yoga.applyLayout(preservingOrigin: true)
  }

    override func updateViewConstraints() {
    super.updateViewConstraints()
    print("updateViewConstraints")
    
//    view.configureLayout(block: { layout in
//      layout.isEnabled = true
//      layout.width = 100%
//      layout.height = 100%
//    })
//
//    container.configureLayout(block: layout.container)
//
//    enterLabel.configureLayout(block: layout.enterLabel)
//    phoneTextField.configureLayout(block: layout.phoneTextField)
//    continueButton.configureLayout(block: layout.continueButton)
//    socialStack.configureLayout(block: layout.socialStack)
//    termLabel.configureLayout(block: layout.termLabel)
//
//    view.yoga.applyLayout(preservingOrigin: true)
  }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    view.subviews.forEach {
//      $0.yoga.markDirty()
//    }
//    view.yoga.applyLayout(preservingOrigin: true)
    super.traitCollectionDidChange(previousTraitCollection)
//    print("traitCollectionDidChange")
  }
  
  private func createUI() {
    [
      enterLabel,
      phoneTextField,
      continueButton,
      socialStack,
      termLabel
      ].forEach { container.addSubview($0) }
    
    view.addSubview(container)
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    
    enterLabel.setStyles(UILabel.Styles.alignCenter,
                         UILabel.ColorStyle.primary)
    enterLabel.styledText = Localized.enterLabel
    
    phoneTextField.placeholder = Localized.phonePlaceholder
    
    continueButton.backgroundColor = ThemeManager.current().colors.brand
    continueButton.layer.cornerRadius = 22.0
    continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
    continueButton.setTitle(Localized.continueButton, for: .normal)
    
    termLabel.setStyles(UILabel.Styles.doubleLine,
                        UILabel.Styles.alignCenter,
                        UILabel.Styles.tiny,
                        UILabel.ColorStyle.primary)
    termLabel.styledText = Localized.termOfUse
    termLabel.colorize(from: 31, to: 60, with: ThemeManager.current().colors.brand)
  }
}

private extension MyViewController {
  enum Localized {
    static let enterLabel = "Вход в личный кабинет"
    static let phonePlaceholder = "Номер телефона"
    static let continueButton = "Продолжить"
    static let termOfUse = "Авторизуясь, вы соглашаетесь с правилами пользования сервисом"
  }
}
