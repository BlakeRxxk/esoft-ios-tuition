//
//  CityViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 14.06.2020.
//

import IGListKit

public final class CityViewModel: NSObject {
  public let id: Int
  public let name: String
  public let coords: String
  public let clockWrap: String?
  public let country: Int
  public let eOfficeId: Int?
  public let created: Date
  public let updated: Date
  public let isSelected: Bool
  
  public init(id: Int,
              name: String,
              coords: String,
              clockWrap: String?,
              country: Int,
              eOfficeId: Int?,
              created: Date,
              updated: Date,
              isSelected: Bool = false
  ) {
    self.id = id
    self.name = name
    self.coords = coords
    self.clockWrap = clockWrap
    self.country = country
    self.eOfficeId = eOfficeId
    self.created = created
    self.updated = created
    self.isSelected = isSelected
  }
}

extension CityViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? CityViewModel else { return false }
    return self == object
  }
}

extension CityViewModel {
  public static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
