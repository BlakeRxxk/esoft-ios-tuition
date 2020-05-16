//
//  EmptyListCell+ListBindable.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit.IGListBindable

extension EmptyListCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? EmptyListViewModel else { return }
     stubView.title = viewModel.title
     stubView.message = viewModel.message
     stubView.image = viewModel.image
     stubView.actionButtonMode = .never
    
    layoutSubviews()
  }
}
