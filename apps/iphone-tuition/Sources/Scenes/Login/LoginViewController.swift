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
import NetworkTrainee
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {
  var networkManager = NetworkManager()
  var disposeBag = DisposeBag()
  
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var enterLabel: UILabel = UILabel()
  private(set) lazy var phoneTextFieldContainer: UIView = UIView()
  private(set) lazy var phoneTextField: UnderscoredTextField = UnderscoredTextField(type: .phone)
  private(set) lazy var continueButton: UIButton = UIButton()
  private(set) lazy var socialStackContainer: UIView = UIView()
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
    bind()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.setStyles(UINavigationItem.Styles.logo)
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.auth)
    addCloseButtonIfNeeded(target: self, action: #selector(handleDismiss))
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let containerSize = view.bounds.size
    view.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
    })

    container.configureLayout(block: layout.container)

    enterLabel.configureLayout(block: layout.enterLabel)
    phoneTextFieldContainer.configureLayout(block: layout.phoneTextFieldContainer)
    phoneTextField.configureLayout(block: layout.phoneTextField)
    continueButton.configureLayout(block: layout.continueButton)
    socialStackContainer.configureLayout(block: layout.socialStackContainer)
    socialStack.configureLayout(block: layout.socialStack)
    termLabel.configureLayout(block: layout.termLabel)

    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    phoneTextFieldContainer.addSubview(phoneTextField)
    socialStackContainer.addSubview(socialStack)
    
    [
      enterLabel,
      phoneTextFieldContainer,
      continueButton,
      socialStackContainer,
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
    
    socialStack.socialList = [.facebook, .ok, .vk]
    socialStack.output = self
    
    termLabel.setStyles(UILabel.Styles.doubleLine,
                        UILabel.Styles.alignCenter,
                        UILabel.Styles.tiny,
                        UILabel.ColorStyle.primary)
    termLabel.styledText = Localized.termOfUse
    termLabel.colorize(from: 31, to: 60, with: ThemeManager.current().colors.brand)
  }
  
  private func bind() {
    // Ниже тест
    var count = 0
    // сделать error на rx (и не как next?)
    continueButton.rx
      .tap
      .bind(onNext: { [unowned self] in
        if count % 2 == 0 {
          self.phoneTextField.errorMessage = "Отсутствует интернет соединение"
        } else {
          self.phoneTextField.errorMessage = nil
        }
        self.socialStack.socialList = [.facebook, .ok, .vk, .google]
        count += 1
      })
      .disposed(by: disposeBag)
  }
  
  @objc private func handleDismiss(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

extension LoginViewController: SocialStackOutput {
  func didTapSocial(social: SocialProviders) {
    print(social)
  }
}

private extension LoginViewController {
  enum Localized {
    static let enterLabel = "Вход в личный кабинет"
    static let phonePlaceholder = "Номер телефона"
    static let continueButton = "Продолжить"
    static let termOfUse = "Авторизуясь, вы соглашаетесь с правилами пользования сервисом"
  }
}
