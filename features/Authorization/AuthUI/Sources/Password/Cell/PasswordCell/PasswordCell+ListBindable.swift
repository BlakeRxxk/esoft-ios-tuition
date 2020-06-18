//
//  PasswordCell+ListBindable.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension PasswordCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? PasswordViewModel else { return }
    
    errorMessage = viewModel.errorMessage
    isWaiting = viewModel.isWaiting

    layoutSubviews()
  }
}
