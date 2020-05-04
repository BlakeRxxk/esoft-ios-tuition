//
//  CityCell+ListBindable.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import IGListKit

extension CityCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? CityViewModel else { return }
    title.styledText = viewModel.name
    
    layoutSubviews()
  }
}
