//
//  CostItemViewYogaIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 26/04/2020.
//

import UIKit

public protocol CostItemViewYogaInput {
  var costSubheader: String { get set }
  var price: String { get set }
  var notice: String { get set }
  var costIcon: UIImage? { get set }
  var costEdit: String { get set }
}
