//
//  AuthCityCellIO.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation

public protocol AuthCityCellInput {
  var cityId: Int { get set }
  var lastCell: Bool { get set }
}

public protocol AuthCityCellOutput: class {
  func didTap(in cell: AuthCityCellInput)
}
