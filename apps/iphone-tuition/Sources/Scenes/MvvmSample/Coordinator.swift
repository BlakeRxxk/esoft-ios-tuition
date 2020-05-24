//
//  Coordinator.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
  func start()
  func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
  func coordinate(to coordinator: Coordinator) {
    coordinator.start()
  }
}
