//
//  SpecialistViewModel.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import ListKit

public final class SpecialistViewModel {
  public let id: Int
  public let fio: String
  public let lkId: Int?
  public let phone: String?
  public let email: String?
  public let photoUrl: URL?
  public let position: String?
  public let positionID: String?
  public let managerID: String?
  public let isMyManager: Bool
  
  public init(id: Int,
              fio: String,
              lkId: Int?,
              phone: String?,
              email: String?,
              photoUrl: URL?,
              position: String?,
              positionID: String?,
              managerID: String?,
              isMyManager: Bool
  ) {
    self.id = id
    self.fio = fio
    self.lkId = lkId
    self.phone = phone
    self.email = email
    self.photoUrl = photoUrl
    self.position = position
    self.positionID = positionID
    self.managerID = managerID
    self.isMyManager = isMyManager
  }
  
  public func isChatAvailable() -> Bool {
    guard let lkID = lkId else { return false }
    
    return lkID > 0
  }
}

extension SpecialistViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? SpecialistViewModel else { return false }
    return id == object.id
  }
}

extension SpecialistViewModel: Equatable {
  public static func == (lhs: SpecialistViewModel, rhs: SpecialistViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
