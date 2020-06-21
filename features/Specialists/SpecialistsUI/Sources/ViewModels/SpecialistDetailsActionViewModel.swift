//
//  SpecialistDetailsActionViewModel.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import UIKit
import IGListDiffKit

public final class SpecialistDetailsActionViewModel {
  let title: String
  let value: String
  let icon: UIImage
  let badgeCount: Int?
  let isActive: Bool
  
  public init(title: String,
              value: String,
              icon: UIImage,
              badgeCount: Int? = nil,
              isActive: Bool = false) {
    self.title = title
    self.value = value
    self.icon = icon
    self.badgeCount = badgeCount
    self.isActive = isActive
  }
}

extension SpecialistDetailsActionViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    value as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? SpecialistDetailsActionViewModel else { return false }
    return value == object.value &&
      title == object.title &&
      badgeCount == object.badgeCount &&
      isActive == object.isActive
  }
}

extension SpecialistDetailsActionViewModel: Equatable {
  public static func == (lhs: SpecialistDetailsActionViewModel, rhs: SpecialistDetailsActionViewModel) -> Bool {
    lhs.value == rhs.value &&
      lhs.title == rhs.title &&
      lhs.badgeCount == rhs.badgeCount &&
      lhs.isActive == rhs.isActive
  }
}
