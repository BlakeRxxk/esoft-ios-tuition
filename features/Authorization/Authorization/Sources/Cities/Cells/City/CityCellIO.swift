//
//  CityCellIO.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import Foundation

public protocol CityCellInput {
  var cityId: Int { get set }
  var lastCell: Bool { get set }
}

public protocol CityCellOutput: class {
  func didTap(in cell: CityCellInput)
}
