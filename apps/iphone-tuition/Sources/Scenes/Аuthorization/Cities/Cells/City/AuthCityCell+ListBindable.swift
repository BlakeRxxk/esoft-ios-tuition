//
//  AuthCityCell+Bind.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension AuthCityCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? AuthCityViewModel else { return }
    
    cityId = viewModel.id
    cityView.name = viewModel.name
    cityView.regions = viewModel.regions
    cityView.isComingSoon = viewModel.isComingSoon

    layoutSubviews()
  }
}
