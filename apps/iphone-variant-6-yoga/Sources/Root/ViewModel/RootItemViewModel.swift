//
//  RootItemViewModel.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import IGListDiffKit

public final class RootViewItemViewModel {
  let id: Int
  let name: String
  
  public init(id: Int, name: String) {
    self.id = id
    self.name = name
  }
}

extension RootViewItemViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? RootViewItemViewModel else { return false }
    return id == object.id && name == object.name
  }
}

extension RootViewItemViewModel: Equatable {
  public static func == (lhs: RootViewItemViewModel, rhs: RootViewItemViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
