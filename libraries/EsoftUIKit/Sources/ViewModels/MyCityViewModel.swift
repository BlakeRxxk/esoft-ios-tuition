//
//  MyCityViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 14.06.2020.
//

import IGListKit

public final class MyCityViewModel: NSObject {
  public let id: String
  public let name: String?
  public let distance: Int?
  public let isLocating: Bool
  
  public init(id: String,
              name: String?,
              distance: Int?,
              isLocating: Bool = false
  ) {
    self.id = id
    self.name = name
    self.distance = distance
    self.isLocating = isLocating
  }
}

extension MyCityViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? MyCityViewModel else { return false }
    return self == object
  }
}

extension MyCityViewModel {
  public static func == (lhs: MyCityViewModel, rhs: MyCityViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
