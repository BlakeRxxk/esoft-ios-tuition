//
//  SpecialistDetailsActionCell+ListBindable.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension SpecialistDetailsActionCell: ListBindable {
  enum ActionStyle {
    case primary
    case inactive
  }
  
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? SpecialistDetailsActionViewModel else { return }
    title = viewModel.title
    value = viewModel.value
    icon = viewModel.icon
    actionStyle = viewModel.isActive ? .primary : .inactive
    
    layoutSubviews()
  }
}
