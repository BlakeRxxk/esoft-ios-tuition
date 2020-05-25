//
//  Loyalty.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct Loyalty {
  public let id: Int
  public let additionalSaleParam: String
  public let address: String
  public let categoryId: Int
  public let cityId: Int
  public let companyDescription: String
  public let companyPartnerName: String
  public let coordinates: Coordinates
  public let dateCreated: String
  public let dateUpdated: String
  public let isFavorite: Bool
  public let level: Int
  public let logo: String
  public let order: Int
  public let firstPhone: String
  public let secondPhone: String
  public let site: String
  public let visible: Bool

  public init(
    id: Int,
    additionalSaleParam: String,
    address: String,
    categoryId: Int,
    cityId: Int,
    companyDescription: String,
    companyPartnerName: String,
    coordinates: String,
    dateCreated: String,
    dateUpdated: String,
    isFavorite: Bool,
    level: Int,
    logo: String,
    order: Int,
    firstPhone: String,
    secondPhone: String,
    site: String,
    visible: Bool
  ) {
    self.id = id
    self.additionalSaleParam = additionalSaleParam
    self.address = address
    self.categoryId = categoryId
    self.cityId = cityId
    self.companyDescription = companyDescription
    self.companyPartnerName = companyPartnerName
    self.coordinates = Coordinates(coordinates: coordinates)
    self.dateCreated = dateCreated
    self.dateUpdated = dateUpdated
    self.isFavorite = isFavorite
    self.level = level
    self.logo = logo
    self.order = order
    self.firstPhone = firstPhone
    self.secondPhone = secondPhone
    self.site = site
    self.visible = visible
  }
}

extension Loyalty: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case additionalSaleParam = "additional_sale_param"
    case address = "addres"
    case categoryId = "category"
    case cityId = "city"
    case companyDescription = "company_description"
    case companyPartnerName = "company_partner_name"
    case coordinates
    case dateCreated = "date_created"
    case dateUpdated = "date_updated"
    case isFavorite = "is_favorite"
    case level
    case logo
    case order
    case firstPhone = "phone1"
    case secondPhone = "phone2"
    case site
    case visible
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(Int.self, forKey: .id)
    additionalSaleParam = try container.decode(String.self, forKey: .additionalSaleParam)
    address = try container.decode(String.self, forKey: .address)
    categoryId = try container.decode(Int.self, forKey: .categoryId)
    cityId = try container.decode(Int.self, forKey: .cityId)
    companyDescription = try container.decode(String.self, forKey: .companyDescription)
    companyPartnerName = try container.decode(String.self, forKey: .companyPartnerName)
    coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
    dateCreated = try container.decode(String.self, forKey: .dateCreated)
    dateUpdated = try container.decode(String.self, forKey: .dateUpdated)
    isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    level = try container.decode(Int.self, forKey: .level)
    logo = try container.decode(String.self, forKey: .logo)
    order = try container.decode(Int.self, forKey: .order)
    firstPhone = try container.decode(String.self, forKey: .firstPhone)
    secondPhone = try container.decode(String.self, forKey: .secondPhone)
    site = try container.decode(String.self, forKey: .site)
    visible = try container.decode(Bool.self, forKey: .visible)
  }
}
