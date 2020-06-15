//
//  CityCell+ListBindable.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension CityCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? CityViewModel else { return }
    
    cityId = viewModel.id
    
    title = viewModel.name // заменить на self? (self.cityTitle -> cityView.title)
    // cityView.secondaryText = viewModel.regionsToString()
    if cityId == 23 {
      cityView.isSelected = true
    }
    else {
      cityView.isSelected = false
    }
    if viewModel.eOfficeId == nil {
      lockSignText = Localized.soon
    } else {
      lockSignText = nil
    }

    layoutSubviews()
  }
}

extension CityCell {
  enum Localized {
    static let soon: String = "Скоро!"
  }
}
