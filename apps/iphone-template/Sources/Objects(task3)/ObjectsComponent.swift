//
//  ObjectsComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation

protocol ObjectsBuilder {
  var objectsViewController: UIViewController { get }
}

class ObjectsComponent: Component<EmptyDependency>, ObjectsBuilder {
  
  var objectsViewController: UIViewController {
    ObjectsViewController()
  }
}
