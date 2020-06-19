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
  public let id: String
  public let price: String
  
  public init(id: String,
              price: String
  ) {
    self.id = id
    self.price = price
  }
}

extension EditSellerPriceViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? EditSellerPriceViewModel else { return false }
    return id == object.id
  }
}

extension EditSellerPriceViewModel: Equatable {
  public static func == (lhs: EditSellerPriceViewModel, rhs: EditSellerPriceViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
