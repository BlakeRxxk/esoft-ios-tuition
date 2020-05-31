//
//  DiscountViewModel.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import IGListKit
import NetworkTrainee

public final class DiscountViewModel {
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
  public let discountUseSpace: String
  public let programs: [LoyaltyProgram]

  public init(id: Int,
              additionalSaleParam: String,
              address: String,
              categoryId: Int,
              cityId: Int,
              aboutCompany: String,
              partnerName: String,
              coordinates: Coordinates,
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
              discountUseSpace: String,
              programs: [LoyaltyProgram]) {
    self.id = id
    self.additionalSaleParam = additionalSaleParam
    self.address = address
    self.categoryId = categoryId
    self.cityId = cityId
    self.aboutCompany = aboutCompany
    self.partnerName = partnerName
    self.coordinates = coordinates
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
    self.discountUseSpace = discountUseSpace
    self.programs = programs
  }
}

extension DiscountViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }

  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? CityViewModel else { return false }
    return id == object.id
  }
}

extension DiscountViewModel: Equatable {
  public static func == (lhs: DiscountViewModel, rhs: DiscountViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
