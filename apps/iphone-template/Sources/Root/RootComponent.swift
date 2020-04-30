//
//  RootComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation

public final class RootComponent: BootstrapComponent {
  
  var rootViewController: UIViewController {
    return CitiesViewController()
  }
}
