//
//  AuthButtonCell+ListBindable.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import EsoftUIKit
import IGListKit.IGListBindable

extension AuthButtonCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? AuthButtonViewModel else { return }
    
    text = viewModel.text
    isWaiting = viewModel.isWaiting
    
    layoutSubviews()
  }
}
