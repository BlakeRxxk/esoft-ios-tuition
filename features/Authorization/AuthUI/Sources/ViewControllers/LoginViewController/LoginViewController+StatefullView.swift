//
//  LoginViewController+StatefullView.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import EsoftUIKit
import YogaKit
import RxExtensions
import ListKit
import StateKit
import IGListDiffKit.IGListDiffable
import AuthCore
import AuthImplementation
import PhoneNumberFormat
import ThemeManager

extension LoginViewController: StatefullView {
  public func bind(store: LoginState) {
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<LoginSections>(sectionControllerProvider: { _, section in
      switch section {
      case .label:
        return LabelSectionController()
      case .input:
        return AuthInputSectionController(self, inset: UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0))
      case .button:
        return AuthButtonSectionController(self, inset: UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0))
      case .socials:
        return SocialsSectionController(self, inset: UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0))
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    Observable.just([
      LabelViewModel(id: 0, text: Localized.enterLabel, padding: (50, 0, 0, 0)) { label in
        label.setStyles(UILabel.Styles.alignCenter,
                        UILabel.ColorStyle.primary)
      },
      AuthInputViewModel(id: 0,
                         placeholder: Localized.phonePlaceholder,
                         showButton: false,
                         formatter: formatPhoneNumber,
                         keyboardType: .numberPad),
      AuthButtonViewModel(id: 0, text: Localized.continueButton, isWaiting: false),
      SocialsViewModel(id: 0, socials: [.facebook, .ok, .vk, .google]),
      LabelViewModel(id: 1, text: Localized.termOfUse, padding: (16, 0, 0, 0)) { label in
            label.setStyles(UILabel.Styles.doubleLine,
                                UILabel.Styles.alignCenter,
                                UILabel.Styles.tiny,
                                UILabel.ColorStyle.primary)
            label.colorize(from: 31, to: 60, with: ThemeManager.current().colors.brand)
      }
    ])
      .map { $0.mapToLoginSections() }
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}

extension LoginViewController {
  enum Localized {
    static let enterLabel = "Вход в личный кабинет"
    static let phonePlaceholder = "Номер телефона"
    static let continueButton = "Продолжить"
    static let termOfUse = "Авторизуясь, вы соглашаетесь с правилами пользования сервисом"
  }
}
