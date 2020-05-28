//
//  MessageViewModel.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import IGListKit

public final class MessageViewModel: NSObject {
  public let id: Int
  public let message: String
  
  public init(id: Int,
              message: String) {
    self.id = id
    self.message = message
  }
}

extension MessageViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? LocationViewModel else { return false }
    return self == object
  }
}

extension MessageViewModel {
  public static func == (lhs: MessageViewModel, rhs: MessageViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
