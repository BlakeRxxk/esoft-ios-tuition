//
//  LoginViewController.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import BaseUI
import EsoftUIKit

final class LoginViewController: ViewController<BaseListView>  {
  private var passwordBuilder: PasswordBuilder // нужен ли он вообще здесь? (как организуется переход от сцене к сцене?)
  
  public init(passwordBuilder: PasswordBuilder) {
    self.passwordBuilder = passwordBuilder
    
    super.init(viewCreator: BaseListView.init)
    
//    configureUI()
  }
}
