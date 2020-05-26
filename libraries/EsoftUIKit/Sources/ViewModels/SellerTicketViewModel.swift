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
//  public let photos: [Photos]
  
  public init(id: String,
              price: String
//              photos: [Photos]
  ) {
    self.id = id
    self.price = price
//    self.photos = photos
  }
  
//  public func isChatAvailable() -> Bool {
//    guard let lkID = lkId else { return false }
//
//    return lkID > 0
//  }
}

//public struct Photos {
//  public let objectID: String
//  public let fileName: String
//}
//
//extension Photos: Codable, Hashable {
//  enum CodingKeys: String, CodingKey {
//    case objectID = "object_id"
//    case fileName = "file_name"
//  }
//}

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
