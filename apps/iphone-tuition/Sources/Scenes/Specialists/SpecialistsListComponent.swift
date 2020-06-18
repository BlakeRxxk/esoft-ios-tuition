//
//  SpecialistsListComponent.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 05.06.2020.
//

import NeedleFoundation
import Foundation
import UIKit
import SpecialistsCore
import SpecialistsUI

protocol SpecialistsListDependency: Dependency {
  var useCase: SpecialistsUseCase { get }
  var router: SpecialistsRouter { get }
}

protocol SpecialistsListBuilder {
  var viewController: UIViewController { get }
}

class SpecialistsListComponent: Component<SpecialistsListDependency>, SpecialistsListBuilder {
  
  var state: SpecialistsListState {
    SpecialistsListState(specialistsUseCase: dependency.useCase)
  }
  
  var viewController: UIViewController {
    let viewController = SpecialistsList()
    viewController.store = state
    viewController.router = dependency.router
    
    return viewController
  }
}
