//
//  SpecialistsRouterImplementation.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import Foundation
import SpecialistsCore
import SpecialistsImplementation
import SpecialistsUI

public final class SpecialistsRouterImplementation: SpecialistsRouter {
  private weak var viewController: UIViewController?
  
  private var detailsBuilder: SpecialistDetailsBuilder
  
  init(detailsBuilder: SpecialistDetailsBuilder) {
    self.detailsBuilder = detailsBuilder
  }
  public func setViewController(_ viewController: UIViewController?) {
    self.viewController = viewController
  }
  
  // MARK: - SpecialistDetails
  public func routeToSpecialistsDetails(specialistID: Int) {
    guard let source = viewController else { return }
    let destination = detailsBuilder.viewController as? SpecialistDetails
    
    destination?.store?.action.onNext(.fetchSpecialist(id: specialistID))
    
    source.show(destination!, sender: nil)
  }
}
