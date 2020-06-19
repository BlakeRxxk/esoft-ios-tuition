//
//  ListHeaderViewModel.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import ListKit

public final class ListHeaderViewModel {
  public let count: Int
  public let title: String
  public let icon: UIImage?
  
  public init(count: Int,
              title: String,
              icon: UIImage? = nil) {
    self.count = count
    self.title = title
    self.icon = icon
  }
}

extension ListHeaderViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    count as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? ListHeaderViewModel else { return false }
    return count == object.count && title == object.title
  }
}

extension ListHeaderViewModel: Equatable {
  public static func == (lhs: ListHeaderViewModel, rhs: ListHeaderViewModel) -> Bool {
    lhs.count == rhs.count && lhs.title == rhs.title
  }
}
