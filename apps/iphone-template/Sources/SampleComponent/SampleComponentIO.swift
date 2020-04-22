//
//  SampleComponentIO.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public protocol SampleComponentInput {
  var sampleText: String { get set }
  var resetText: String { get set }
}

public protocol SampleComponentOutput: class {
  func didTapActionButton(in sampleView: SampleComponentInput)
  func reset()
}
