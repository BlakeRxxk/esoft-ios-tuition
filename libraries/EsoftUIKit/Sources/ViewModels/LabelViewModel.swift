//
//  LabelViewModel.swift
//  EsoftUIKit
//
//  Created by nedstar on 19.06.2020.
//

import UIKit
import IGListKit

public final class LabelViewModel: NSObject {
  public typealias Padding = (top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat)
  
  public let id: Int
  public let text: String
  public let padding: Padding
  public let builder: (UILabel) -> Void
  
  public init(id: Int,
              text: String,
              padding: Padding,
              builder: @escaping (UILabel) -> Void
  ) {
    self.id = id
    self.text = text
    self.padding = padding
    self.builder = builder
  }
}

extension LabelViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    self
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? LabelViewModel else { return false }
    return self == object
  }
}

extension LabelViewModel {
  public static func == (lhs: LabelViewModel, rhs: LabelViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
