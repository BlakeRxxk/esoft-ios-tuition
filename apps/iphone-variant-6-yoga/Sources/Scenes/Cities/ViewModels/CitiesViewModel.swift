//
//  CitiesViewModel.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import IGListKit

public final class CityViewModel {
  let id: Int
  let name: String
  
  public init(id: Int, name: String) {
    self.id = id
    self.name = name
  }
}

extension CityViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? CityViewModel else { return false }
    return id == object.id && name == object.name
  }
}

extension CityViewModel: Equatable {
  public static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
