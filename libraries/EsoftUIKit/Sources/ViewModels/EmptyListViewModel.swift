//
//  EmptyListViewModel.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import ListKit

public final class EmptyListViewModel {
  public let title: String
  public let message: String
  public let image: UIImage
  public let displayedWithTitle: Bool
  public let keyboardHeight: CGFloat?
  public let adjustSafeArea: Bool
  
  public init(title: String,
              message: String,
              image: UIImage,
              displayedWithTitle: Bool = false,
              keyboardHeight: CGFloat? = nil,
              adjustSafeArea: Bool = false) {
    self.title = title
    self.message = message
    self.image = image
    self.displayedWithTitle = displayedWithTitle
    self.keyboardHeight = keyboardHeight
    self.adjustSafeArea = adjustSafeArea
  }
}

extension EmptyListViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    title as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? EmptyListViewModel else { return false }
    return title == object.title &&
      message == object.message &&
      displayedWithTitle == object.displayedWithTitle &&
      keyboardHeight == object.keyboardHeight &&
      adjustSafeArea == object.adjustSafeArea
  }
}

extension EmptyListViewModel: Equatable {
  public static func == (lhs: EmptyListViewModel, rhs: EmptyListViewModel) -> Bool {
    lhs.title == rhs.title &&
      lhs.message == rhs.message &&
      lhs.displayedWithTitle == rhs.displayedWithTitle &&
      lhs.keyboardHeight == rhs.keyboardHeight &&
      lhs.adjustSafeArea == rhs.adjustSafeArea
  }
}
