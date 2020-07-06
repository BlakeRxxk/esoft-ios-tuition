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
  private var editDescriptionBuilder: EditDescriptionBuilder
  
  init(detailsBuilder: EditSellerPriceBuilder, editDescriptionBuilder: EditDescriptionBuilder) {
    self.detailsBuilder = detailsBuilder
    self.editDescriptionBuilder = editDescriptionBuilder
  }
  
  public func setViewController(_ viewController: UIViewController?) {
    self.viewController = viewController
  }
  
  // MARK: - SpecialistDetails
  public func routeToEditSellerPrice(sellerTicketID: Int) {
    guard let source = viewController else { return }
    let destination = detailsBuilder.viewController as? EditSellerPriceController
    
    destination?.store?.action.onNext(.fetchSellerTicket(id: sellerTicketID))
    source.present(UINavigationController(rootViewController: destination!), animated: true)
  }
  
  public func routeToEditDescription(desc: String) {
    guard let source = viewController else { return }
    let destination = editDescriptionBuilder.viewController as? EditDescriptionController
    
    destination?.store?.action.onNext(.fetchSellerTicket(desc: desc))
    source.present(UINavigationController(rootViewController: destination!), animated: true)
  }
}
