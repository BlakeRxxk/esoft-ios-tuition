//
//  MyCityCell+ListBindable.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import EsoftUIKit
import IGListKit.IGListBindable

extension MyCityCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? MyCityViewModel else { return }
    
    myCity = viewModel.name

    layoutSubviews()
  }
}