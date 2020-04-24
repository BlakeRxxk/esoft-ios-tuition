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

final class ViewController: UIViewController {
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
  
  private func createUI() {
    view.addSubview(container)
    
    [
      enterLabel,
      phoneTextField,
      continueButton,
      socialStack,
      termLabel,
      ].forEach { container.addSubview($0) }
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
    let str: NSMutableAttributedString = NSMutableAttributedString.init(attributedString: termLabel.attributedText!)
    str.addAttribute(.foregroundColor, value: ThemeManager.current().colors.brand, range: NSRange(location: 31, length: 30))
    termLabel.attributedText = str
  }
  
  override func viewDidLayoutSubviews() {
    let containerSize = view.bounds.size
    view.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
    })
    
    container.configureLayout(block: layout.container)
    enterLabel.configureLayout(block: layout.enterLabel)
    phoneTextField.configureLayout(block: layout.phoneTextField)
    continueButton.configureLayout(block: layout.continueButton)
    socialStack.configureLayout(block: layout.socialStack)
    termLabel.configureLayout(block: layout.termLabel)
    
    view.yoga.applyLayout(preservingOrigin: true)
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
