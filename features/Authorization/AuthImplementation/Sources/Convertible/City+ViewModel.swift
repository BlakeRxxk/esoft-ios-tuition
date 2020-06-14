//
//  Specialist+ViewModel.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import EsoftUIKit
import AuthCore

extension City {
  public func asViewModel() -> CityViewModel {
    return CityViewModel(id: id,
                         name: name,
                         coords: coords,
                         clockWrap: clockWrap,
                         country: country,
                         eOfficeId: eOfficeId,
                         created: stringToDate(from: created)!,
                         updated: stringToDate(from: updated)!)
  }
}
