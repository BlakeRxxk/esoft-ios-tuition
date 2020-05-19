//
//  LoginCell.swift
//  AppLibrary
//
//  Created by nedstar on 19.05.2020.
//

import UIKit
import RxSwift
import RxCocoa
import YogaKit
import Network
import BaseUI
import EsoftUIKit
import ListKit
import IGListKit
import ThemeManager
import Localized

public protocol LoginCellOutput: class {
  func didTapSocial(social: SocialProviders)
  func didTapContinueButton()
  func phoneDidChange(newVal: String)
}

public final class LoginCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "LoginCellID"
  
  var disposeBag = DisposeBag()
  
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var enterLabel: UILabel = UILabel()
  private(set) lazy var phoneTextFieldContainer: UIView = UIView()
  private(set) lazy var phoneTextField: NotifyingTextField = NotifyingTextField(type: .phone)
  private(set) lazy var continueButton: UIButton = UIButton()
  private(set) lazy var socialStackContainer: UIView = UIView()
  private(set) lazy var socialStack: SocialStack = SocialStack()
  private(set) lazy var termLabel: UILabel = UILabel()
  
  internal lazy var layout: Layout = Layout()
  
  public weak var output: LoginCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
    bind()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    // сбросить что то?
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
    
    contentView.addSubview(container)
  }
  
  private func configureUI() {
    contentView.backgroundColor = ThemeManager.current().colors.container
    
    enterLabel.setStyles(UILabel.Styles.alignCenter,
                         UILabel.ColorStyle.primary)
    enterLabel.styledText = Localized.enterLabel
    
    phoneTextField.placeholder = Localized.phonePlaceholder
    phoneTextField.output = self
    
    continueButton.backgroundColor = ThemeManager.current().colors.brand
    continueButton.layer.cornerRadius = 22.0
    continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
    continueButton.setTitle(Localized.continueButton, for: .normal)
    
    socialStack.socialList = [.facebook, .ok, .vk, .google]
    socialStack.output = self
    
    termLabel.setStyles(UILabel.Styles.doubleLine,
                        UILabel.Styles.alignCenter,
                        UILabel.Styles.tiny,
                        UILabel.ColorStyle.primary)
    termLabel.styledText = Localized.termOfUse
    termLabel.colorize(from: 31, to: 60, with: ThemeManager.current().colors.brand)
  }
  
  private func bind() {
    // не вызывать метод, а возвращать последовательность?
    continueButton.rx
      .tap
      .bind(onNext: { [unowned self] in
        self.output?.didTapContinueButton()
      })
      .disposed(by: disposeBag)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let containerSize = contentView.bounds.size
    contentView.configureLayout(block: { layout in
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
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension LoginCell: SocialStackOutput {
  public func didTapSocial(social: SocialProviders) {
    self.output?.didTapSocial(social: social)
  }
}

extension LoginCell: NotifyingTextFieldOutput {
  public func valueDidChange(sender: NotifyingTextField, newVal: String) {
    self.output?.phoneDidChange(newVal: newVal)
  }
}

// подключить к локализации
private extension LoginCell {
  enum Localized {
    static let enterLabel = "Вход в личный кабинет"
    static let phonePlaceholder = "Номер телефона"
    static let continueButton = "Продолжить"
    static let termOfUse = "Авторизуясь, вы соглашаетесь с правилами пользования сервисом"
  }
}
