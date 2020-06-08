//
//  PhotoItemViewYogaIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 26/04/2020.
//

import UIKit.UIImage

public protocol PhotoItemViewYogaInput {
  var photoSubheader: String { get set }
  var dataSet: [String] { get set }
  var showAll: String { get set }
  var showAllCount: String { get set }
  var showAllCountImage: UIImage? { get set }
}
