//
//  SellerTicket+ViewModel.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import EsoftUIKit
import SellerTicketCore
import CDNImageLink

extension SellerTicket {
  public func asViewModel() -> SellerTicketViewModel {
    let dataImg = photos.map { $0.fileName }
    //    let profileImage = URL(string: photoUrl?.profile ?? "")
    return SellerTicketViewModel(id: id,
                                 price: price + "000",
                                 photos: dataImg,
                                 desc: desc)
    //    photoUrl: profileImage,
  }
}
