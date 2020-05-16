//
//  Specialists.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public struct Specialist {
  public let id: String
  public let fio: String
  public let lkId: Int?
  public let lk: LK?
  public let phone: String?
  public let email: String?
  public let photoUrl: String?
  public let position: String?
  public let positionID: String?
  public let managerID: String?
  public let isMyManager: Bool?
  
  public init(id: String,
              fio: String,
              lkId: Int?,
              phone: String?,
              email: String?,
              photoUrl: String?,
              lk: LK?,
              position: String?,
              positionID: String?,
              managerID: String?,
              isMyManager: Bool? = false) {
    self.id = id
    self.fio = fio
    self.lkId = lkId
    self.phone = phone
    self.email = email
    self.lk = lk
    self.photoUrl = photoUrl
    self.position = position
    self.positionID = positionID
    self.managerID = managerID
    self.isMyManager = isMyManager
  }
}

extension Specialist: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case fio
    case lkId = "lk_user_id"
    case phone = "phone_for_mobile"
    case email
    case photoUrl = "photo"
    case lk
    case position = "position_name"
    case positionID = "position"
    case managerID = "manager_id"
    case isMyManager = "is_my_manager"
  }
}
