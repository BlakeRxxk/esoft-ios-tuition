//
//  PreviewItemViewIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 21.04.2020.
//

import UIKit

public protocol PreviewItemViewInput {
  var currentPrice: String { get set }
  var price: String { get set }
  var address: String { get set }
  var photo: UIImage? { get set }
}
