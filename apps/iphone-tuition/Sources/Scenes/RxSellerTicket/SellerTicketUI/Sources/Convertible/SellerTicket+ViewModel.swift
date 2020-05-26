//
//  SellerTicket+ViewModel.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import EsoftUIKit
import SpecialistsCore
import CDNImageLink

extension SellerTicket {
  public func asViewModel() -> SellerTicketViewModel {
    //    let profileImage = URL(string: photoUrl?.profile ?? "")
    return SellerTicketViewModel(id: id,
    //    photoUrl: profileImage,
      price: price)
  }
}
