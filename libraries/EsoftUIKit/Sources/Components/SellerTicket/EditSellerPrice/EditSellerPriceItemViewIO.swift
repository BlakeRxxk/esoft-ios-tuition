//
//  EditSellerPriceItemViewIO.swift
//  EsoftUIKit
//
//  Created by wtildestar on 17/06/2020.
//

import Foundation

public protocol EditSellerPriceItemViewInput {
  var recomendedPrice: String { get set }
}

public protocol EditSellerPriceItemViewOutput: AnyObject {
  func didTapAction(in view: EditSellerPriceItemViewInput)
}
