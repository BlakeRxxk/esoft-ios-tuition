//
//  LoginViewController.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import BaseUI
import EsoftUIKit
import YogaKit
import RxSwift
import RxCocoa
import RxExtensions
import ListKit
import IGListDiffKit.IGListDiffable

public protocol PasswordBuilder {
  var passwordViewController: UIViewController { get }
}

final public class LoginViewController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  private var passwordBuilder: PasswordBuilder
  
  public init(passwordBuilder: PasswordBuilder) {
    self.passwordBuilder = passwordBuilder
    
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.setStyles(UINavigationItem.Styles.logo)
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.auth)
    addCloseButtonIfNeeded(target: self, action: #selector(handleDismiss))
  }
  
  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    bind()
  }
  
  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let container = view.bounds.size
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    specializedView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func configureUI() {
    specializedView.collectionView.setStyles(UIView.Styles.whiteBackground)
    specializedView.collectionView.refreshControl = nil
    specializedView.collectionView.bounces = false
  }
  
  public func bind() {
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
    
    let source = RxListAdapterDataSource<LoginSections>(sectionControllerProvider: { _, section in
      switch section {
      case .single:
        return LoginSectionController(self)
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    Observable.just([SingleViewModel()])
      .map { $0.mapToLoginSections() }
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
  
  @objc private func handleDismiss(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

extension LoginViewController: LoginSectionControllerOutput {
  public func didTapSocial(social: SocialProviders) {
    print(social)
  }
  
  public func didTapContinueButton() {
    let passwordViewController = passwordBuilder.passwordViewController
    passwordViewController.view.setStyles(UIView.Styles.whiteBackground)
    show(passwordViewController, sender: nil)
  }
  
  public func phoneDidChange(newVal: String) {
    print(newVal)
  }
}
