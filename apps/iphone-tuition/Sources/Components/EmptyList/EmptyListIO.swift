//
//  EmptyListIO.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit

public protocol EmptyListInput {
  var title: String { get set }
  var message: String { get set }
  var image: UIImage { get set }
  var actionTitle: String { get set }
  var adjustSafeArea: Bool { get set }
}

public protocol EmptyListOutput: class {
  func didTapActionButton(in stubView: EmptyListInput)
}
