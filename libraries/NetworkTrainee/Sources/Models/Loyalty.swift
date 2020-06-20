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
  public let aboutCompany: String
  public let partnerName: String
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
  public let programs: [LoyaltyProgram]

  public init(
    id: Int,
    additionalSaleParam: String,
    address: String,
    categoryId: Int,
    cityId: Int,
    aboutCompany: String,
    partnerName: String,
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
    visible: Bool,
    programs: [LoyaltyProgram]
  ) {
    self.id = id
    self.additionalSaleParam = additionalSaleParam
    self.address = address
    self.categoryId = categoryId
    self.cityId = cityId
    self.aboutCompany = aboutCompany
    self.partnerName = partnerName
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
    self.programs = programs
  }
}

extension Loyalty: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case additionalSaleParam = "additional_sale_param"
    case address = "addres"
    case categoryId = "category"
    case cityId = "city"
    case aboutCompany = "company_description"
    case partnerName = "company_partner_name"
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
    case programs = "program_view"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = Int(try container.decode(String.self, forKey: .id)) ?? 0
    categoryId = Int(try container.decode(String.self, forKey: .categoryId)) ?? 0
    cityId = Int(try container.decode(String.self, forKey: .cityId)) ?? 23
    level = Int(try container.decode(String.self, forKey: .level)) ?? 0
    order = Int(try container.decode(String.self, forKey: .order)) ?? 0

    additionalSaleParam = try container.decode(String.self, forKey: .additionalSaleParam)
    address = try container.decode(String.self, forKey: .address)
    aboutCompany = try container.decode(String.self, forKey: .aboutCompany)
    partnerName = try container.decode(String.self, forKey: .partnerName)
    coordinates = Coordinates(coordinates: try container.decode(String.self, forKey: .coordinates))
    dateCreated = try container.decode(String.self, forKey: .dateCreated)
    dateUpdated = try container.decode(String.self, forKey: .dateUpdated)
    logo = try container.decode(String.self, forKey: .logo)
    firstPhone = try container.decode(String.self, forKey: .firstPhone)
    secondPhone = try container.decode(String.self, forKey: .secondPhone)
    site = try container.decode(String.self, forKey: .site)
    programs = try container.decode([LoyaltyProgram].self, forKey: .programs)

    visible = ((try? container.decode(String.self, forKey: .visible).getBoolValue()) != nil)
    isFavorite = ((try? container.decode(String.self, forKey: .isFavorite).getBoolValue()) != nil)
  }
}
