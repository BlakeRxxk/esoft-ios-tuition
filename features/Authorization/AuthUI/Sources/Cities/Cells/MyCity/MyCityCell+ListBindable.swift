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
    
    myCityName = viewModel.name ?? (viewModel.isLocating ? Localized.locating : Localized.determineLocation)
    isLocating = viewModel.isLocating

    layoutSubviews()
  }
}

extension MyCityCell {
  enum Localized {
    static let determineLocation = "Определить местоположение"
    static let locating = "Определяем местоположение"
  }
}
