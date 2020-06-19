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
  var title: String { get set }
  var secondaryText: String? { get set }
  var lockSignText: String? { get set }
}

public protocol CityCellOutput: AnyObject {
  func didTap(in cell: CityCellInput)
}
