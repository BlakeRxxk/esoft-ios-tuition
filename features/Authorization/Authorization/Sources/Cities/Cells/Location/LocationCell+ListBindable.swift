//
//  LocationCell+ListBindable.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import EsoftUIKit
import IGListKit.IGListBindable

extension LocationCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? LocationViewModel else { return }
    
//    location = viewModel.name

    layoutSubviews()
  }
}
