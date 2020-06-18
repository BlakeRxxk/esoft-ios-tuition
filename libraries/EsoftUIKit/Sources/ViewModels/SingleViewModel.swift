//
//  SingleViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

import IGListKit

public final class SingleViewModel: NSObject {
  public let id: Int
  
  public init(id: Int = 0) {
    self.id = id
  }
}

extension SingleViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? SingleViewModel else { return false }
    return self == object
  }
}

extension SingleViewModel {
  public static func == (lhs: SingleViewModel, rhs: SingleViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
