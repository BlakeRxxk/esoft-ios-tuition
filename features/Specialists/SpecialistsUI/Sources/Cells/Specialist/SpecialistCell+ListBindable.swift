//
//  SpecialistCell+ListBindable.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension SpecialistCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? SpecialistViewModel else { return }
    specialistView.position = viewModel.position ?? ""
    specialistView.avatarURL = viewModel.photoUrl
    phoneNumber = viewModel.phone ?? ""
    specialistID = viewModel.id
    specialistName = viewModel.fio
    isChatAvaliable = viewModel.isChatAvailable()
    
    if isChatAvaliable {
      chatRow.setStyles(IconItemView.Styles.primary)
    }

    layoutSubviews()
  }
}
