//
//  AuthInputCell+ListBindable.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import EsoftUIKit
import IGListKit.IGListBindable

extension AuthInputCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? AuthInputViewModel else { return }
  
    placeholder = viewModel.placeholder
    showButton = viewModel.showButton
    formatter = viewModel.formatter
    keyboardType = viewModel.keyboardType

    layoutSubviews()
  }
}
