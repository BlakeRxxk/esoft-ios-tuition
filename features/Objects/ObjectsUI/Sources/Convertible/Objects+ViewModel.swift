//
//  Objects+ViewModel.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 28.05.2020.
//

import Foundation
import EsoftUIKit
import ObjectsCore
import CDNImageLink

extension Object {
  public func asViewModel() -> ObjectsViewModel {
    let dataImg = photosUrl!.map { $0.fileName }
    let phone = specialist?.phoneForMobile ?? ""
    
    return ObjectsViewModel(id: id,
                            price: price,
                            oldPrice: oldPrice ?? "",
                            city: city,
                            district: district,
                            street: street,
                            house: house,
                            type: type,
                            roomsCount: roomsCount,
                            areaFlat: areaFlat,
                            floorsNum: floorsNum,
                            floorsCnt: floorsCnt,
                            priceAr: priceAr ?? "",
                            viewsCount: viewsCount ?? "",
                            isFavorite: isFavorite ?? "",
                            photos: dataImg,
                            rating: rating,
                            isViewed: isViewed ?? false,
                            phone: phone)
  }
}
