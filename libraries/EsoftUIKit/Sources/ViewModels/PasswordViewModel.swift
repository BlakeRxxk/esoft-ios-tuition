//
//  PasswordViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

import IGListKit

public final class PasswordViewModel: NSObject {
  public let id: Int
  public let errorMessage: String?
  public let isWaiting: Bool
  
  public init(id: Int,
              errorMessage: String?,
              isWaiting: Bool) {
    self.id = id
    self.errorMessage = errorMessage
    self.isWaiting = isWaiting
  }
}

extension PasswordViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? PasswordViewModel else { return false }
    return self == object
  }
}

extension PasswordViewModel {
  public static func == (lhs: PasswordViewModel, rhs: PasswordViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
