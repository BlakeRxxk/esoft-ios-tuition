//
//  Specialist+ViewModel.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import SpecialistsCore
import CDNImageLink
import EsoftUIKi

extension Specialist {
  public func asViewModel() -> SpecialistViewModel {
    let profileImage = URL(string: photoUrl?.profile ?? "")
    return SpecialistViewModel(id: Int(id) ?? 0,
                               fio: fio,
                               lkId: lk?.id,
                               phone: phone,
                               email: email,
                               photoUrl: profileImage,
                               position: position,
                               positionID: positionID,
                               managerID: managerID,
                               isMyManager: isMyManager ?? false)
  }
}
