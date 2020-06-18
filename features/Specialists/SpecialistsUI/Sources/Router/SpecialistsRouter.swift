//
//  SpecialistsRouter.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit

public protocol SpecialistsRouter: AnyObject {
  func routeToSpecialistsDetails(specialistID: Int)
}
