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

extension Objects {
    public func asViewModel() -> ObjectsViewModel {
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
                                isFavorite: isFavorite ?? "")
    }
}
