//
//  DistrictsViewModel.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 29.04.2020.
//

import Foundation
import IGListKit

public final class DistrictsViewModel {
  let id: Int
  let name: String
  let coords: String
  
  public init(id: Int, name: String, coords: String) {
    self.id = id
    self.name = name
    self.coords = coords
  }
}

extension DistrictsViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? DistrictsViewModel else { return false }
    return id == object.id && name == object.name
  }
}

extension DistrictsViewModel: Equatable {
  public static func == (lhs: DistrictsViewModel, rhs: DistrictsViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
