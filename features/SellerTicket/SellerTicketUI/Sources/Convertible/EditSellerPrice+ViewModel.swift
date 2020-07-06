//
//  EditSellerPrice+ViewModel.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import Foundation
import EsoftUIKit
import SellerTicketCore
import CDNImageLink

extension RecomendedPrice {
  public func asViewModel() -> EditSellerPriceViewModel {
    let objPrice = objectPrice.map { $0.price + "000"}
    //    let profileImage = URL(string: photoUrl?.profile ?? "")
    return EditSellerPriceViewModel(objectPrice: objPrice)
    //    photoUrl: profileImage,
  }
}
