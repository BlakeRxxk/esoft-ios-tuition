//
//  CityViewModel.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 26.05.2020.
//

import IGListKit

public final class CityViewModel: NSObject {
  public let id: Int
  public let name: String
  public let regions: [String]?
  public let isComingSoon: Bool
  
  public init(id: Int,
              name: String,
              regions: [String]?,
              isComingSoon: Bool = false) {
    self.id = id
    self.name = name
    self.regions = regions
    self.isComingSoon = isComingSoon
  }
  
  public func regionsToString() -> String? {
    return regions?.joined(separator: ", ")
  }
}

extension CityViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? CityViewModel else { return false }
    return id == object.id
  }
}

extension CityViewModel {
  public static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
