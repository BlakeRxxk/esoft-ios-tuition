//
//  PreviewItemViewYOGAIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 23.04.2020.
//

import UIKit

public protocol PreviewItemViewInputYOGA {
  var currentPrice: String { get set }
  var oldPrice: String { get set }
  var photos: [String] { get set }
  var address: String { get set }
  
  var objectsDescription: String { get set }
  
  var views: String { get set }
  var favorites: String { get set }
  var code: String { get set }
}
