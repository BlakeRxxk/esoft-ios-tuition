//
//  ListHeaderCell+ListBindable.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit.IGListBindable

extension ListHeaderCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? ListHeaderViewModel else { return }
    headerTitle = viewModel.title
    iconImage = viewModel.icon
    
    layoutSubviews()
  }
}
