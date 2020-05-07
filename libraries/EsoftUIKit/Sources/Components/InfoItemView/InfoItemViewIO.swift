//
//  infoViewIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 19.04.2020.
//

import UIKit

public protocol InfoItemViewInput {
  var firstIcon: UIImage? { get set }
  var firstTitle: String { get set }
  
  var secondIcon: UIImage? { get set }
  var secondTitle: String { get set }
  
  var thirdTitle: String { get set }
}
