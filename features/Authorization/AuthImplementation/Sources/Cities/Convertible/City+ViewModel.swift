//
//  City+ViewModel.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import EsoftUIKit
import AuthCore

extension City {
  public func asViewModel(isSelected: Bool = false) -> CityViewModel {
    CityViewModel(id: id,
                  name: name,
                  coords: coords,
                  clockWrap: clockWrap,
                  country: country,
                  eOfficeId: eOfficeId,
                  created: stringToDate(from: created)!,
                  updated: stringToDate(from: updated)!,
                  isSelected: isSelected
    )
  }
}
