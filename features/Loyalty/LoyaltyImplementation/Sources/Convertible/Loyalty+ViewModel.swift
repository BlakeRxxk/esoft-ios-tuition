//
//  Loyalty+ViewModel.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import EsoftUIKit
import LoyaltyCore
import CDNImageLink

extension Loyalty {
  public func asViewModel() -> DiscountViewModel {
//    guard let discount = self.programs[0] else { return }
    return DiscountViewModel(id: id,
                            additionalSaleParam: additionalSaleParam,
                            address: address,
                            categoryId: categoryId,
                            cityId: cityId,
                            aboutCompany: aboutCompany,
                            partnerName: partnerName,
                            coordinates: coordinates,
                            dateCreated: dateCreated,
                            dateUpdated: dateUpdated,
                            isFavorite: isFavorite,
                            level: level,
                            logo: logo,
                            order: order,
                            firstPhone: firstPhone,
                            secondPhone: secondPhone,
                            site: site,
                            visible: visible,
                            discountUseSpace: programs[0].discountUseSpace,
                            programs: programs)
  }
}
