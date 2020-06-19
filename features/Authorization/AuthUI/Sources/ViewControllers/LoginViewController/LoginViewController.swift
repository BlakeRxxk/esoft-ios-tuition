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
    
    RxKeyboard
      .instance
      .visibleHeight
      .drive(onNext: { [unowned self] keyboardVisibleHeight in
        self.view.yoga.paddingBottom = YGValue(keyboardVisibleHeight)
        self.view.yoga.applyLayout(preservingOrigin: true)
        self.view.layoutIfNeeded()
      })
      .disposed(by: disposeBag)
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
  
  @objc private func handleDismiss(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

extension LoginViewController: AuthInputSectionControllerOutput {
  public func textDidChange(newVal: String) {
    print("login: \(newVal)")
    store?.action.onNext(.changeLogin(newVal))
  }
}

extension LoginViewController: AuthButtonSectionControllerOutput {
  public func didTapeButton() {
    print("didTap: continueButton")
    show(passwordBuilder.passwordViewController, sender: nil)
  }
}

extension LoginViewController: SocialsSectionControllerOutput {
  public func didTapSocial(social: SocialProviders) {
    print("didTap: \(social)")
  }
}
