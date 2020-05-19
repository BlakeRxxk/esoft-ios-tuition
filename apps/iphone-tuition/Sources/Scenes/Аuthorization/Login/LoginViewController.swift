//
//  SampleViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
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

final class LoginViewController: ViewController<BaseListView> {
  private var passwordBuilder: PasswordBuilder // нужен ли он вообще здесь? (как организуется переход от сцене к сцене?)
  
  public init(passwordBuilder: PasswordBuilder) {
    self.passwordBuilder = passwordBuilder
    
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.setStyles(UINavigationItem.Styles.logo)
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.auth)
    addCloseButtonIfNeeded(target: self, action: #selector(handleDismiss))
  }
  
  override func viewDidLayoutSubviews() {
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
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.specializedView.adapter?.performUpdates(animated: true)
  }
  
  private func configureUI() {
    specializedView.adapter?.dataSource = self
    
    view.backgroundColor = ThemeManager.current().colors.container
  }
  
  @objc private func handleDismiss(sender: UIButton) {
    // перевести на rx
    dismiss(animated: true, completion: nil)
  }
}

extension LoginViewController: LoginSectionControllerOutput {
  func didTapSocial(social: SocialProviders) {
    print(social)
  }
  
  func didTapContinueButton() {
    print("tap")
//    self.show(self.passwordBuilder.passwordViewController, sender: nil)
  }
  
  func phoneDidChange(newVal: String) {
    print(newVal)
  }
}

extension LoginViewController: ListAdapterDataSource {
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    [LoginViewModel(id: 0, keyboardHeight: 180)]
  }
  
  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    LoginSectionController(output: self)
  }
  
  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    nil
  }
}
