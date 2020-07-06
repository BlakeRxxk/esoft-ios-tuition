//
//  SellerTicketViewModel.swift
//  AppLibrary
//
//  Created by wtildestar on 08/05/2020.
//

import Foundation
import IGListKit
import NetworkTrainee

public final class SellerTicketViewModel {
  let id: String
  let price: String
  let photos: [Photos]
  
  public init(id: String, price: String, photos: [Photos]) {
    self.id = id
    self.price = price
    self.photos = photos
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


