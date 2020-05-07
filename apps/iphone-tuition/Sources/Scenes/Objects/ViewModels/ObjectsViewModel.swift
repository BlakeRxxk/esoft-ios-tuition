//
//  ObjectsViewModel.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation
import IGListKit

public final class ObjectViewModel {
  let id: String
  let description: String
  
  public init(id: String, description: String) {
    self.id = id
    self.description = description
  }
}

extension ObjectViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? ObjectViewModel else { return false }
    return id == object.id && description == object.description
  }
}

extension ObjectViewModel: Equatable {
  public static func == (lhs: ObjectViewModel, rhs: ObjectViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
