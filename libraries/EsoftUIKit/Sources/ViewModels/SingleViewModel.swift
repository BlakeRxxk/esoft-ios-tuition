//
//  SingleViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

import IGListKit

public class SingleViewModel: ListDiffable {
  public let id: Int
  
  public init(id: Int = 0) {
    self.id = id
  }
  
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    true
  }
}
