//
//  UnauthorizedListCell+ListBindable.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit.IGListBindable

extension UnauthorizedListCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? UnauthorizedListViewModel else { return }
    stubView.title = viewModel.title
    stubView.message = viewModel.message
    stubView.image = viewModel.image
    stubView.actionTitle = viewModel.actionTitle
    stubView.adjustSafeArea = viewModel.adjustSafeArea
    stubView.actionButtonMode = .show
    
    layoutSubviews()
  }
}
