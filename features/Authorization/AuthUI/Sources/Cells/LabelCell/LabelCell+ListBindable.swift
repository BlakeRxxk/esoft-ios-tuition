//
//  AuthHeaderCell+ListBindable.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import EsoftUIKit
import IGListKit.IGListBindable

extension LabelCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? LabelViewModel else { return }
  
    text = viewModel.text
    build(viewModel.builder)

    layoutSubviews()
  }
}
