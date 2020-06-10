//
//  SpecialistDetailsActionCellIO.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit.UIImage
import Foundation

public protocol SpecialistDetailsActionCellInput {
  var title: String { get set }
  var value: String { get set }
  var icon: UIImage { get set }
}

public protocol SpecialistDetailsActionCellOutput: class {
  func didTapAction(in cell: SpecialistDetailsActionCellInput)
}
