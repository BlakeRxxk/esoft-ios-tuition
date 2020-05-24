//
//  SpecialistCellIO.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

public protocol SpecialistCellInput {
  var specialistID: Int { get set }
  var specialistName: String { get set }
  var phoneNumber: String { get set }
  var isChatAvaliable: Bool { get set }
}

public protocol SpecialistCellOutput: class {
  func didTapSpecialist(in cell: SpecialistCellInput)
  func didTapChat(in cell: SpecialistCellInput)
  func didTapPhone(in cell: SpecialistCellInput)
}
