//
//  SpecialistDetailsCell+ListBindable.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension SpecialistDetailsCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? SpecialistViewModel else { return }
    specialistView.fullName = viewModel.fio
    specialistView.position = viewModel.position ?? ""
    specialistView.avatarURL = viewModel.photoUrl
    phoneNumber = viewModel.phone ?? ""
    email = viewModel.email ?? ""
    
    layoutSubviews()
  }
}
