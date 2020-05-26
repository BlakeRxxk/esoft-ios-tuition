//
//  LocationCellIO.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import Foundation

public protocol LocationCellInput {
  var location: String? { get set }
}

public protocol LocationCellOutput: AnyObject {
  func didTap(in cell: LocationCellInput)
}
