//
//  SocialsViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 19.06.2020.
//

import IGListKit

public final class SocialsViewModel: NSObject {
  public let id: Int
  public let socials: [SocialProviders]
  
  public init(id: Int,
              socials: [SocialProviders]) {
    self.id = id
    self.socials = socials
  }
}

extension SocialsViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? SocialsViewModel else { return false }
    return self == object
  }
}

extension SocialsViewModel {
  public static func == (lhs: SocialsViewModel, rhs: SocialsViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
