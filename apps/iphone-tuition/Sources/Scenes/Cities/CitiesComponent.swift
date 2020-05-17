//
//  CitiesComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation

protocol CitiesBuilder {
  var citiesViewController: UIViewController { get }
}

class CitiesComponent: Component<EmptyDependency>, CitiesBuilder {
  
  var citiesViewController: UIViewController {
    CitiesViewController()
  }
}
