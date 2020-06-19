//
//  SpecialistDetailComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import UIKit
import SpecialistsCore
import SpecialistsUI

protocol SpecialistDetailsDependency: Dependency {
  var useCase: SpecialistsUseCase { get }
}

protocol SpecialistDetailsBuilder {
  var viewController: UIViewController { get }
}

class SpecialistDetailsComponent: Component<SpecialistDetailsDependency>, SpecialistDetailsBuilder {

  var state: SpecialistDetailState {
    SpecialistDetailState(specialistsUseCase: dependency.useCase)
  }
  
  var viewController: UIViewController {
    let viewController = SpecialistDetails()
    viewController.store = state

    return viewController
  }
}
