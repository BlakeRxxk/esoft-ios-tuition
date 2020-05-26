//
//  City.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import IGListKit

public final class AuthCityViewModel {
  public let id: Int
  public let name: String
  public let regions: [String]
  public let isComingSoon: Bool
  
  public init(id: Int,
              name: String,
              regions: [String],
              isComingSoon: Bool
  ) {
    self.id = id
    self.name = name
    self.regions = regions
    self.isComingSoon = isComingSoon
  }
}

extension AuthCityViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? AuthCityViewModel else { return false }
    return id == object.id
  }
}

extension AuthCityViewModel: Equatable {
  public static func == (lhs: AuthCityViewModel, rhs: AuthCityViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
