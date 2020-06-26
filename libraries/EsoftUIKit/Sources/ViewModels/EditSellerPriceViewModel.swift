//
//  EditSellerPriceViewModel.swift
//  EsoftUIKit
//
//  Created by wtildestar on 17/06/2020.
//

import Foundation
import IGListKit
import ListKit

public final class EditSellerPriceViewModel {
  public let objectPrice: [String]
  
  public init(objectPrice: [String]) {
    self.objectPrice = objectPrice
  }
}

extension EditSellerPriceViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    objectPrice as NSObjectProtocol
  }

  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? EditSellerPriceViewModel else { return false }
    return objectPrice == object.objectPrice
  }
}

extension EditSellerPriceViewModel: Equatable {
  public static func == (lhs: EditSellerPriceViewModel, rhs: EditSellerPriceViewModel) -> Bool {
    lhs.objectPrice == rhs.objectPrice
  }
}
