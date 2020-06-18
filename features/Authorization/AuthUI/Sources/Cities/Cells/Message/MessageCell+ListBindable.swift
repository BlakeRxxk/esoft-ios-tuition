//
//  MessageCell+ListBindable.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import EsoftUIKit
import IGListKit.IGListBindable

extension MessageCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? MessageViewModel else { return }
    
    message = viewModel.message

    layoutSubviews()
  }
}
