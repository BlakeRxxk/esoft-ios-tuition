//
//  SellerTicketRouterImplementation.swift
//  AppLibrary
//
//  Created by wtildestar on 18/06/2020.
//

import UIKit
import Foundation
import SellerTicketCore
import SellerTicketImplementation
import SellerTicketUI

public final class SellerTicketRouterImplementation: SellerTicketRouter {
  private weak var viewController: UIViewController?
  
  private var detailsBuilder: EditSellerPriceBuilder
  
  init(detailsBuilder: EditSellerPriceBuilder) {
    self.detailsBuilder = detailsBuilder
  }
  public func setViewController(_ viewController: UIViewController?) {
    self.viewController = viewController
  }
  
  // MARK: - SpecialistDetails
  public func routeToEditSellerPrice(sellerTicketID: Int) {
    guard let source = viewController else { return }
    let destination = detailsBuilder.viewController as? EditSellerPriceList
    
    destination?.store?.action.onNext(.fetchSellerTicket(id: sellerTicketID))
    
    source.show(destination!, sender: nil)
  }
}
