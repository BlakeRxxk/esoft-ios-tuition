//
//  ListSkeletonViewModel.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import ListKit

public final class ListSkeletonViewModel {
  let id: Int

  public init(id: Int) {
    self.id = id
  }
}

extension ListSkeletonViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? ListSkeletonViewModel else { return false }
    return id == object.id
  }
}

extension ListSkeletonViewModel: Equatable {
  public static func == (lhs: ListSkeletonViewModel, rhs: ListSkeletonViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
