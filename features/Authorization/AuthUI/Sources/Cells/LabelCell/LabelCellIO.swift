//
//  AuthHeaderCellIO.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import UIKit
import EsoftUIKit

public protocol LabelCellInput {
  var text: String? { get set }
  func build(_ builder: (UILabel) -> Void)
}
