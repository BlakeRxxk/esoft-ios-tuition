//
//  SellerTicketCell+ListBindable.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension SellerTicketCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? SellerTicketViewModel else { return }
    price = viewModel.price
    dataSet = viewModel.photos
  }
}
