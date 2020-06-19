//
//  RMSpecialist.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RealmSwift
import SpecialistsCore
import StorageKit

@objcMembers public final class RMSpecialist: Object {
  dynamic var id: Int = 0
  dynamic var fio: String = ""
  dynamic var lkId: Int = 0
  dynamic var phone: String?
  dynamic var email: String?
  dynamic var photoUrl: String?
  dynamic var position: String?
  dynamic var positionID: Int = 0
  dynamic var managerID: Int = 0
  dynamic var isMyManager: Bool = false

  override public static func primaryKey() -> String? {
    "id"
  }
}

extension RMSpecialist: EntityConvertibleType {
  public func asEntity() -> Specialist {
    Specialist(id: String(id),
                      fio: fio,
                      lkId: lkId,
                      phone: phone,
                      email: email,
                      photoUrl: photoUrl,
                      lk: LKEntity(id: lkId),
                      position: position,
                      positionID: String(positionID),
                      managerID: String(managerID),
                      isMyManager: isMyManager)
  }
}

extension Specialist: RealmRepresentable {
  public var uuid: String {
    ""
  }
  
  public func asRealm() -> RMSpecialist {
    RMSpecialist.build { object in
      object.id = Int(id) ?? 0
      object.fio = fio
      object.lkId = lk?.id ?? 0
      object.phone = phone
      object.email = email
      object.photoUrl = photoUrl
      object.position = position
      object.positionID = Int(positionID ?? "") ?? 0
      object.managerID = Int(managerID ?? "") ?? 0
      object.isMyManager = isMyManager ?? false
    }
  }
}
