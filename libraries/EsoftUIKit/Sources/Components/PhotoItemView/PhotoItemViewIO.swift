//
//  PhotoItemViewIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 21/04/2020.
//

import UIKit.UIImage

public protocol PhotoItemViewInput {
  var subheader: String { get set }
  var dataSet: [String] { get set }
  var firstTitle: String { get set }
  var secondTitle: String { get set }
  var icon: UIImage? { get set }
}

