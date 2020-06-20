//
//  RMLoyalty.swift
//  LoyaltyImplementation
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import RealmSwift
import LoyaltyCore
import StorageKit

@objcMembers public final class RMLoyalty: Object {
  dynamic var id: Int = 0
  dynamic var additionalSaleParam: String = ""
  dynamic var address: String = ""
  dynamic var categoryId: Int = 0
  dynamic var cityId: Int = 23
  dynamic var aboutCompany: String = ""
  dynamic var partnerName: String = ""
  dynamic var coordinates: Coordinates = Coordinates()
  dynamic var dateCreated: String = ""
  dynamic var dateUpdated: String = ""
  dynamic var isFavorite: Bool = false
  dynamic var level: Int = 0
  dynamic var logo: String = ""
  dynamic var order: Int = 0
  dynamic var firstPhone: String = ""
  dynamic var secondPhone: String = ""
  dynamic var site: String = ""
  dynamic var visible: Bool = false
  dynamic var programs: [LoyaltyProgram] = []

  override public static func primaryKey() -> String? {
    "id"
  }
}

extension RMLoyalty: EntityConvertibleType {
  public func asEntity() -> Loyalty {
    Loyalty(id: id,
            additionalSaleParam: additionalSaleParam,
            address: address,
            categoryId: categoryId,
            cityId: cityId,
            aboutCompany: aboutCompany,
            partnerName: partnerName,
            coordinates: coordinates.asString(),
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
            programs: programs)
  }
}

extension Loyalty: RealmRepresentable {
  public var uuid: String {
    ""
  }
  
  public func asRealm() -> RMLoyalty {
    RMLoyalty.build { object in
      object.id = Int(id) ?? 0
      object.additionalSaleParam = additionalSaleParam
      object.address = address
      object.categoryId = Int(categoryId)
      object.cityId = Int(cityId)
      object.aboutCompany = aboutCompany
      object.partnerName = partnerName
      object.coordinates = coordinates
      object.dateCreated = dateCreated
      object.dateUpdated = dateUpdated
      object.isFavorite = isFavorite ?? false
      object.level = Int(level)
      object.logo = logo
      object.order = Int(order)
      object.firstPhone = firstPhone
      object.secondPhone = secondPhone
      object.site = site
      object.visible = visible ?? false
      object.programs = programs
    }
  }
}
