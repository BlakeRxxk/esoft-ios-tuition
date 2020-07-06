//
//  EditDescription+ViewModel.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import Foundation
import EsoftUIKit
import SellerTicketCore
import CDNImageLink

extension Desc {
  public func asViewModel() -> EditDescriptionViewModel {
//    let dataImg = photos.map { $0.fileName }
//        let profileImage = URL(string: photoUrl?.profile ?? "")
//    return SellerTicketViewModel(id: id,
//                                 price: price,
//                                 photos: dataImg)
//        photoUrl: profileImage,
    return EditDescriptionViewModel(desc: desc)
  }
}
