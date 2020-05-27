//
//  CountryViewModel.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 26.05.2020.
//

import IGListKit

public final class LocationViewModel: NSObject {
  public let id: Int
  public let name: String
  
  public init(id: Int,
              name: String) {
    self.id = id
    self.name = name
  }
}

extension LocationViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? LocationViewModel else { return false }
    return id == object.id
  }
}

extension LocationViewModel {
  public static func == (lhs: LocationViewModel, rhs: LocationViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
