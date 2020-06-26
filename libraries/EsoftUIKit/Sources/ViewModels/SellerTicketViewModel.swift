//
//  SellerTicketViewModel.swift
//  EsoftUIKit
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import IGListKit
import ListKit

public final class SellerTicketViewModel {
  public let id: String
  public let price: String
  public let photos: [String]
  public let desc: String
  
  public init(id: String,
              price: String,
              photos: [String],
              desc: String
  ) {
    self.id = id
    self.price = price
    self.photos = photos
    self.desc = desc
  }
}

extension SellerTicketViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? SellerTicketViewModel else { return false }
    return id == object.id
  }
}

extension SellerTicketViewModel: Equatable {
  public static func == (lhs: SellerTicketViewModel, rhs: SellerTicketViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
