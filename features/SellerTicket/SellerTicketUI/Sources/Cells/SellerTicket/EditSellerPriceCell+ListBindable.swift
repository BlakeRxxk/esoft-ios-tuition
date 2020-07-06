//
//  EditSellerPriceCell+ListBindable.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension EditSellerPriceCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? EditSellerPriceViewModel else { return }
//    price = viewModel.price
//    dataSet = viewModel.photos
    
  }
}
