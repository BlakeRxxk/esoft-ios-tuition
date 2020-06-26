//
//  EditDescriptionViewModel.swift
//  EsoftUIKit
//
//  Created by wtildestar on 26/06/2020.
//

import Foundation
import IGListKit
import ListKit

public final class EditDescriptionViewModel {
  public let desc: [String]
  
  public init(desc: [String]) {
    self.desc = desc
  }
}

extension EditDescriptionViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    desc as NSObjectProtocol
  }

  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? EditDescriptionViewModel else { return false }
    return desc == object.desc
  }
}

extension EditDescriptionViewModel: Equatable {
  public static func == (lhs: EditDescriptionViewModel, rhs: EditDescriptionViewModel) -> Bool {
    lhs.desc == rhs.desc
  }
}
