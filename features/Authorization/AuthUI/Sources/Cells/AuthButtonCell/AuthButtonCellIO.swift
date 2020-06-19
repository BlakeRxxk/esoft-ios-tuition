//
//  AuthButtonCellIO.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import Foundation

public protocol AuthButtonCellInput {
  var text: String? { get set }
  var isWaiting: Bool { get set }
}

public protocol AuthButtonCellOutput: AnyObject {
  func didTapeButton()
}
