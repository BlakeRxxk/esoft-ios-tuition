//
//  UnauthorizedListViewModel.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import ListKit

public final class UnauthorizedListViewModel {
  let title: String
  let message: String
  let image: UIImage
  let actionTitle: String
  let displayedWithTitle: Bool
  let adjustSafeArea: Bool
  
  public init(title: String,
              message: String,
              image: UIImage,
              actionTitle: String,
              displayedWithTitle: Bool = false,
              adjustSafeArea: Bool = false) {
    self.title = title
    self.message = message
    self.image = image
    self.actionTitle = actionTitle
    self.displayedWithTitle = displayedWithTitle
    self.adjustSafeArea = adjustSafeArea
  }
}

extension UnauthorizedListViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    title as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? UnauthorizedListViewModel else { return false }
    return title == object.title &&
      message == object.message &&
      actionTitle == object.actionTitle &&
      displayedWithTitle == object.displayedWithTitle &&
      adjustSafeArea == object.adjustSafeArea
  }
}

extension UnauthorizedListViewModel: Equatable {
  public static func == (lhs: UnauthorizedListViewModel, rhs: UnauthorizedListViewModel) -> Bool {
    lhs.title == rhs.title &&
      lhs.message == rhs.message &&
      lhs.actionTitle == lhs.actionTitle &&
      lhs.displayedWithTitle == rhs.displayedWithTitle &&
      lhs.adjustSafeArea == rhs.adjustSafeArea
  }
}
