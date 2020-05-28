//
//  City+ViewModel.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 28.05.2020.
//

import Foundation
import EsoftUIKit

extension City {
  public func asViewModel() -> CityViewModel {
    return CityViewModel(id: id, name: name, regions: regions, isComingSoon: isComingSoon)
  }
}
