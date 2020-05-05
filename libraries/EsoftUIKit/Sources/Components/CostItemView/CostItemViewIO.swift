//
//  CostItemViewIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 19/04/2020.
//

import UIKit

public protocol CostItemViewInput {
  var subheader: String { get set }
  var firstTitle: String { get set }
  var secondTitle: String { get set }
  var icon: UIImage? { get set }
  var thirdTitle: String { get set }
}
