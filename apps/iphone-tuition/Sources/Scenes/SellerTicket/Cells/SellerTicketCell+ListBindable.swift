//
//  SellerTicketCell+ListBindable.swift
//  AppLibrary
//
//  Created by wtildestar on 08/05/2020.
//

import Foundation
import IGListKit
import NetworkTrainee

extension SellerTicketCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? SellerTicketViewModel else { return }
    costItemViewYoga.price = viewModel.price
    let images = viewModel.photos.map { $0.fileName }
    
    photoItemViewYoga.dataSet = images
    layoutSubviews()
  }
}
