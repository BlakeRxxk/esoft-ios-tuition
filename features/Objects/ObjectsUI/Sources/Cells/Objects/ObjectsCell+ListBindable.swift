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
    print("viewModel ", viewModel)
//    specialistView.position = viewModel.position ?? ""
//    specialistView.avatarURL = viewModel.photoUrl
//    phoneNumber = viewModel.phone ?? ""
//    specialistID = viewModel.id
//    specialistName = viewModel.fio
//    isChatAvaliable = viewModel.isChatAvailable()
    
//    if isChatAvaliable {
//      chatRow.setStyles(IconItemView.Styles.primary)
//    }

    layoutSubviews()
  }
}
