//
//  EditDescriptionCell+ListBindable.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension EditDescriptionCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? EditDescriptionViewModel else { return }
//    price = viewModel.price
//    dataSet = viewModel.photos
  }
}
