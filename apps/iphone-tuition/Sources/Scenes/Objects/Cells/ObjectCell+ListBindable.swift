//
//  ObjectCell+ListBindable.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation

import IGListKit

extension ObjectCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? ObjectViewModel else { return }
    previewItemViewYOGA.price = viewModel.id
    
    layoutSubviews()
  }
}
