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
    
    costSubheader = "Стоимость объекта"
    price = viewModel.price
    notice = "Выше рыночной на 90%"
    costEdit = "Изменить"
    
    photoSubheader = "Фотографии"
    showAll = "Показать все"
    showAllCount = "123"
    
//    if isChatAvaliable {
//      chatRow.setStyles(IconItemView.Styles.primary)
//    }
    
    layoutSubviews()
  }
}
