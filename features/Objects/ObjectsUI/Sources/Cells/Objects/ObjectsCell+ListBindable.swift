//
//  ObjectsCell+ListBindable.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 28.05.2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension ObjectsCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? ObjectsViewModel else { return }
    
    currentPrice = "\(viewModel.price) руб."
    oldPrice = viewModel.oldPrice
    address = viewModel.address
    objectsDescription = viewModel.objectsDescription
    views = viewModel.viewsCount
    favoritesCount = viewModel.rating
    code = viewModel.id
    photos = viewModel.photos
    
    layoutSubviews()
  }
}
