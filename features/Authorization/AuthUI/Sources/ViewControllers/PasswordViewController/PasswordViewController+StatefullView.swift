//
//  PasswordViewController+StatefullView.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import EsoftUIKit
import YogaKit
import RxExtensions
import ListKit
import StateKit
import IGListDiffKit.IGListDiffable
import AuthCore
import AuthImplementation

extension PasswordViewController: StatefullView {
  public func bind(store: PasswordState) {
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<PasswordSections>(sectionControllerProvider: { _, section in
      switch section {
      case .label:
        return LabelSectionController()
      case .input:
        return AuthInputSectionController(self, inset: UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0))
      case .button:
        return AuthButtonSectionController(self, inset: UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0))
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    state
      .map { state in [
        LabelViewModel(id: 0, text: Localized.enterLabel, padding: (50, 0, 0, 0)) { label in
          label.setStyles(UILabel.Styles.alignCenter,
                          UILabel.ColorStyle.primary)
        },
        AuthInputViewModel(id: 0,
                           placeholder: Localized.passwordPlaceholder,
                           showButton: true,
                           errorMessage: state.errorMessage),
        AuthButtonViewModel(id: 0, text: Localized.continueButton, isWaiting: state.isWaiting),
        LabelViewModel(id: 1, text: Localized.forgotten, padding: (29, 0, 0, 0)) { label in
          label.setStyles(UILabel.Styles.singleLine,
                          UILabel.Styles.alignCenter,
                          UILabel.Styles.headline,
                          UILabel.ColorStyle.system)
          }
        ]
      }
    .map { $0.mapToPasswordSections() }
    .bind(to: adapter.rx.objects(for: source))
    .disposed(by: disposeBag)
    
    state
      .map { $0.isAvailable }
      .asDriver(onErrorJustReturn: false)
      .asObservable()
      .bind(onNext: { [unowned self] isAvailabel in
        if isAvailabel {
          self.openCities()
        }
      })
      .disposed(by: disposeBag)
  }
}

extension PasswordViewController {
  enum Localized {
    static let enterLabel = "Вход в личный кабинет"
    static let passwordPlaceholder = "Пароль"
    static let continueButton = "Продолжить"
    static let forgotten = "Забыли пароль?"
  }
}
