//
//  AuthButtonViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 19.06.2020.
//

import IGListKit

public final class AuthButtonViewModel: NSObject {
  public let id: Int
  public let text: String?
  public let isWaiting: Bool
  
  public init(id: Int,
              text: String?,
              isWaiting: Bool) {
    self.id = id
    self.text = text
    self.isWaiting = isWaiting
  }
}

extension AuthButtonViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? AuthButtonViewModel else { return false }
    return self == object
  }
}

extension AuthButtonViewModel {
  public static func == (lhs: AuthButtonViewModel, rhs: AuthButtonViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
