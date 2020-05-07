//
//  RootViewItemCell+ListBindable.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import IGListKit

extension RootViewItemCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? RootViewItemViewModel else { return }

    name = viewModel.name
    
    layoutSubviews()
  }
}
