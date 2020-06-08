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
    costItemViewYoga.costSubheader = "Стоимость объекта"
    costItemViewYoga.price = viewModel.price
    costItemViewYoga.notice = "Выше рыночной на 90%"
    costItemViewYoga.costEdit = "Изменить"
    
    photoItemViewYoga.photoSubheader = "Фотографии"
    photoItemViewYoga.showAll = "Показать все"
    photoItemViewYoga.showAllCount = "123"
    
    let images = viewModel.photos.map { $0.fileName }
    
    photoItemViewYoga.dataSet = images
    print("ViewModel: ", viewModel)
    layoutSubviews()
  }
}
