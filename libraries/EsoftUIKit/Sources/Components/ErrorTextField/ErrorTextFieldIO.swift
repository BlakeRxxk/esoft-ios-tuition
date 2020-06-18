//
//  ErrorTextFieldIO.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

import UIKit

public protocol ErrorTextFieldInput {
  var errorMessage: String? { get set }
  var showButton: Bool { get set }
}
