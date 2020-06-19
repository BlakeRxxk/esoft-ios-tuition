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
//    let dataImg = photos.map { $0.fileName }
    //    let profileImage = URL(string: photoUrl?.profile ?? "")
    return EditSellerPriceViewModel(id: id, price: price)
    //    photoUrl: profileImage,
  }
}
