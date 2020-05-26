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
    
//    costItemViewYoga.subheader = "Стоимость объекта"
//    costItemViewYoga.firstTitle = viewModel.price
//    costItemViewYoga.secondTitle = "Выше рыночной на 90%"
//    costItemViewYoga.thirdTitle = "Изменить"
//    
//    photoItemViewYoga.subheader = "Фотографии"
//    photoItemViewYoga.firstTitle = "Показать все"
//    photoItemViewYoga.secondTitle = "123"
    
//    if isChatAvaliable {
//      chatRow.setStyles(IconItemView.Styles.primary)
//    }
    
    layoutSubviews()
  }
}
