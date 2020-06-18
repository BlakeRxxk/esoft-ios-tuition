//
//  SpecialistDetailsCellIO.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public protocol SpecialistDetailsCellInput {
  var phoneNumber: String { get set }
  var email: String { get set }
}

public protocol SpecialistDetailsCellOutput: class {
  func didTapEmail(in cell: SpecialistDetailsCellInput)
  func didTapPhone(in cell: SpecialistDetailsCellInput)
}
