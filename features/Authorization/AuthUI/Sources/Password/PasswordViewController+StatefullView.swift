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
    // MARK: - KeyboardHeight
    RxKeyboard
      .instance
      .visibleHeight
      .drive(onNext: { [unowned self] keyboardVisibleHeight in
        print(keyboardVisibleHeight)
        self.view.yoga.paddingBottom = YGValue(keyboardVisibleHeight)
        self.view.yoga.applyLayout(preservingOrigin: true)
        self.view.layoutIfNeeded()
      })
      .disposed(by: disposeBag)
    
    rx
      .viewDidAppear
      .map { _ in PasswordState.Action.completeInit }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    // MARK: - State
    let state = store.state.distinctUntilChanged().share()

    let source = RxListAdapterDataSource<PasswordSections>(sectionControllerProvider: { _, section in
      switch section {
      case .password:
        return PasswordSectionController(self)
      }
    })

    guard let adapter = specializedView.adapter else { return }
    
    state.map { state in
        [PasswordViewModel(id: 0, errorMessage: state.errorMessage, isWaiting: state.isWaiting)]
    }
    .map { $0.mapToPasswordSections() }
    .bind(to: adapter.rx.objects(for: source))
    .disposed(by: disposeBag)
  }
}
