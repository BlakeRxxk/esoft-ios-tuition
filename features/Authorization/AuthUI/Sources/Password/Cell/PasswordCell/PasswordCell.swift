//
//  PasswordCell.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import UIKit
import YogaKit
import BaseUI
import ThemeManager
import EsoftUIKit
import ListKit
import IGListKit
import RxSwift
import RxCocoa
import RxExtensions
import PhoneNumberFormat
import Localized

public final class PasswordCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "PasswordCellID"
  
  var disposeBag = DisposeBag()
  
  public var errorMessage: String? {
    get {
      passwordTextField.errorMessage
    }
    set {
      passwordTextField.errorMessage = newValue
    }
  }
  public var isWaiting: Bool = false {
    didSet {
      if isWaiting {
        continueButton.setTitle(nil, for: .normal)
        continueButton.setImage(UIImage.Spinner.base, for: .normal)
      } else {
        continueButton.setTitle(Localized.continueButton, for: .normal)
        continueButton.setImage(nil, for: .normal)
      }
      continueButton.yoga.markDirty()
    }
  }
  
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var enterLabel: UILabel = UILabel()
  private(set) lazy var passwordTextFieldContainer: UIView = UIView()
  private(set) lazy var passwordTextField: ErrorTextField = ErrorTextField()
  private(set) lazy var continueButton: UIButton = UIButton()
  private(set) lazy var forgottenLabel: UILabel = UILabel()
  
  internal lazy var layout: Layout = Layout()
  
  public weak var output: PasswordCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
    bind()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createUI() {
    passwordTextFieldContainer.addSubview(passwordTextField)
    
    [
      enterLabel,
      passwordTextFieldContainer,
      continueButton,
      forgottenLabel
      ].forEach { container.addSubview($0) }
    
    contentView.addSubview(container)
  }
  
  private func configureUI() {
    enterLabel.setStyles(UILabel.Styles.alignCenter,
                         UILabel.ColorStyle.primary)
    enterLabel.styledText = Localized.enterLabel
    
    passwordTextField.textField.placeholder = Localized.passwordPlaceholder
    passwordTextField.textField.keyboardType = .numberPad
    passwordTextField.showButton = true
    
    // Сделать стили, использовать ThemeManager
    continueButton.setStyles(UIView.Styles.brandBackground)
    continueButton.tintColor = UIColor.white
    continueButton.layer.cornerRadius = 22.0
    continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
    continueButton.setTitle(Localized.continueButton, for: .normal)
    
    forgottenLabel.setStyles(UILabel.Styles.singleLine,
                             UILabel.Styles.alignCenter,
                             UILabel.Styles.headline,
                             UILabel.ColorStyle.system)
    forgottenLabel.styledText = Localized.forgotten
  }
  
  private func bind() {
    continueButton.rx
      .tap
      .bind(onNext: { [unowned self] in
        self.output?.didTapContinueButton()
      })
      .disposed(by: disposeBag)
    
    passwordTextField.textField.rx.text
      .bind(onNext: { [unowned self] text in
        self.output?.passwordDidChange(newVal: text ?? "")
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
    passwordTextFieldContainer.configureLayout(block: layout.passwordTextFieldContainer)
    passwordTextField.configureLayout(block: layout.passwordTextField)
    continueButton.configureLayout(block: layout.continueButton)
    forgottenLabel.configureLayout(block: layout.forgottenLabel)
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension PasswordCell: PasswordCellInput {}

private extension PasswordCell {
  enum Localized {
    static let enterLabel = "Вход в личный кабинет"
    static let passwordPlaceholder = "Пароль"
    static let continueButton = "Продолжить"
    static let forgotten = "Забыли пароль?"
  }
}
