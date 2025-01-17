//
//  ListHeaderSkeletonViewModel.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import ListKit

public final class ListHeaderSkeletonViewModel {
  let id: Int

  public init(id: Int) {
    self.id = id
  }
}

extension ListHeaderSkeletonViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? ListHeaderSkeletonViewModel else { return false }
    return id == object.id
  }
}

extension ListHeaderSkeletonViewModel: Equatable {
  public static func == (lhs: ListHeaderSkeletonViewModel, rhs: ListHeaderSkeletonViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
