//
//  LoyaltyProgram.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct LoyaltyProgram {
  public let levelCompany, id, cityId, partnerId, amount, categoryId: Int
  public let discountInfo, cityName, partnerDiscount, receipt: String
  public let category, link, type, pushNotificationStock: String
  public let stockDateStart, stockDateEnd, introductoryDiscount: String
  public let dateCreated, dateUpdated, dateAddDiscount, stock: String
  public let popupMessage, partnerName, logo: String
  public let discountUseSpace, lifecycle: String
  public let isActiveStock, isStock, isFavorite, isNew, present, giftPresent: Bool
}

extension LoyaltyProgram: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case cityId = "city"
    case cityName = "city_name"
    case partnerId = "company_partner_id"
    case discountInfo = "discount_info"
    case amount = "discount_scale"
    case partnerDiscount = "partner_discount"
    case receipt = "how_take_discount"
    case discountUseSpace = "discount_use_space"
    case lifecycle = "date_of_discount_live"
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
    case partnerName = "company_partner_name"
    case logo
    case categoryId = "category_id"
    case category
    case isActiveStock = "is_active_stock"
    case isStock = "is_stock"
    case isNew = "is_new"
    case link
    case levelCompany = "level_company"
    case type = "discount_type"
    case isFavorite = "is_favorite"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = Int(try container.decode(String.self, forKey: .id)) ?? 0
    cityId = Int(try container.decode(String.self, forKey: .cityId)) ?? 23
    partnerId = Int(try container.decode(String.self, forKey: .partnerId)) ?? 0
    categoryId = Int(try container.decode(String.self, forKey: .categoryId)) ?? 0
    levelCompany = Int(try container.decode(String.self, forKey: .levelCompany)) ?? 0

    cityName = try container.decode(String.self, forKey: .cityName)
    discountInfo = try container.decode(String.self, forKey: .discountInfo)
    amount = Int(try container.decode(String.self, forKey: .amount).deleteSpaces()) ?? 0
    partnerDiscount = try container.decode(String.self, forKey: .partnerDiscount)
    receipt = try container.decode(String.self, forKey: .receipt)
    discountUseSpace = try container.decode(String.self, forKey: .discountUseSpace)
    lifecycle = try container.decode(String.self, forKey: .lifecycle)
    dateCreated = try container.decode(String.self, forKey: .dateCreated)
    dateUpdated = try container.decode(String.self, forKey: .dateUpdated)
    dateAddDiscount = try container.decode(String.self, forKey: .dateAddDiscount)
    stock = try container.decode(String.self, forKey: .stock)
    stockDateStart = try container.decode(String.self, forKey: .stockDateStart)
    stockDateEnd = try container.decode(String.self, forKey: .stockDateEnd)
    introductoryDiscount = try container.decode(String.self, forKey: .introductoryDiscount)
    pushNotificationStock = try container.decode(String.self, forKey: .pushNotificationStock)
    popupMessage = try container.decode(String.self, forKey: .popupMessage)
    partnerName = try container.decode(String.self, forKey: .partnerName)
    logo = try container.decode(String.self, forKey: .logo)
    category = try container.decode(String.self, forKey: .category)
    link = try container.decode(String.self, forKey: .link)
    type = try container.decode(String.self, forKey: .type)

    present = ((try? container.decode(String.self, forKey: .present).getBoolValue()) != nil)
    giftPresent = ((try? container.decode(String.self, forKey: .giftPresent).getBoolValue()) != nil)
    isActiveStock = ((try? container.decode(String.self, forKey: .isActiveStock).getBoolValue()) != nil)
    isStock = ((try? container.decode(String.self, forKey: .isStock).getBoolValue()) != nil)
    isNew = ((try? container.decode(String.self, forKey: .isNew).getBoolValue()) != nil)
    isFavorite = ((try? container.decode(String.self, forKey: .isFavorite).getBoolValue()) != nil)
  }
}

extension String {
  func deleteSpaces() -> String {
    self.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
  }

  func getBoolValue() -> Bool {
    if self.lowercased() == "no"
      || self.lowercased() == "нет"
      || self == "0"
      || self.isEmpty
      || self == "null" {
      return false
    }
    return true
  }
}
