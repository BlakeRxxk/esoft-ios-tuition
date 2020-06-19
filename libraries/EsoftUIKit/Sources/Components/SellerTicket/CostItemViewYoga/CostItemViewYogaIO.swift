//
//  CostItemViewYogaIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 26/04/2020.
//

import UIKit

public protocol CostItemViewYogaInput {
  var price: String { get set }
}

public protocol CostItemViewYogaOutput: class {
  func didTapAction(in view: CostItemViewYogaInput)
}
