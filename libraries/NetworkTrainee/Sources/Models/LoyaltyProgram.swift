//
//  LoyaltyProgram.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct LoyaltyProgram {
  let levelCompany, id, cityId, companyPartnerID, discountScale, categoryID, giftPresent: Int
  let discountInfo, cityName, partnerDiscount, howTakeDiscount: String
  let category, link, discountType, pushNotificationStock: String
  let stockDateStart, stockDateEnd, introductoryDiscount: String
  let dateCreated, dateUpdated, dateAddDiscount, stock: String
  let popupMessage, companyPartnerName, logo: String
  let discountUseSpace, dateOfDiscountLive: String
  let isActiveStock, isStock, isFavorite, isNew, present: Bool

//  public init(
//    levelCompany, id, cityId, companyPartnerID, discountScale, categoryID, giftPresent: Int,
//    discountInfo, cityName, partnerDiscount, howTakeDiscount: String,
//    category, link, discountType, pushNotificationStock: String,
//    stockDateStart, stockDateEnd, introductoryDiscount: String,
//    dateCreated, dateUpdated, dateAddDiscount, stock: String,
//    popupMessage, companyPartnerName, logo: String,
//    discountUseSpace, dateOfDiscountLive: String,
//    isActiveStock, isStock, isFavorite, isNew, present: Bool,
//  ) {
//    self.id = id
//    self.levelCompany = levelCompany
//    self.cityId = cityId
//    self.companyPartnerID = companyPartnerID
//    self.discountScale = discountScale
//    self.categoryID = categoryID
//    self.discountInfo = discountInfo
//    self.giftPresent = giftPresent
//    self.giftPresent = giftPresent
//    self.giftPresent = giftPresent
//    self.giftPresent = giftPresent
//    self.giftPresent = giftPresent
//    self.giftPresent = giftPresent
//  }
}

extension LoyaltyProgram: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case cityId = "city"
    case cityName = "city_name"
    case companyPartnerID = "company_partner_id"
    case discountInfo = "discount_info"
    case discountScale = "discount_scale"
    case partnerDiscount = "partner_discount"
    case howTakeDiscount = "how_take_discount"
    case discountUseSpace = "discount_use_space"
    case dateOfDiscountLive = "date_of_discount_live"
    case present
    case giftPresent = "gift_present"
    case dateCreated = "date_created"
    case dateUpdated = "date_updated"
    case dateAddDiscount = "date_add_discount"
    case stock
    case stockDateStart = "stock_date_start"
    case stockDateEnd = "stock_date_end"
    case introductoryDiscount = "introductory_discount"
    case pushNotificationStock = "push_notification_stock"
    case popupMessage = "popup_message"
    case companyPartnerName = "company_partner_name"
    case logo
    case categoryID = "category_id"
    case category
    case isActiveStock = "is_active_stock"
    case isStock = "is_stock"
    case isNew = "is_new"
    case link
    case levelCompany = "level_company"
    case discountType = "discount_type"
    case isFavorite = "is_favorite"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(Int.self, forKey: .id)
    cityId = try container.decode(Int.self, forKey: .cityId)
    companyPartnerID = try container.decode(Int.self, forKey: .companyPartnerID)
    id = try container.decode(Int.self, forKey: .id)
    id = try container.decode(Int.self, forKey: .id)


    cityName = try container.decode(String.self, forKey: .cityName)
    discountInfo = try container.decode(String.self, forKey: .discountInfo)
  }
}
