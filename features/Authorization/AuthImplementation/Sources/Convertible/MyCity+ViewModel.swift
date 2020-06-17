//
//  MyCity+ViewModel.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import EsoftUIKit
import AuthCore

extension MyCity {
  public func asViewModel() -> MyCityViewModel {
    MyCityViewModel(id: id,
                    name: name,
                    distance: distance)
  }
}
