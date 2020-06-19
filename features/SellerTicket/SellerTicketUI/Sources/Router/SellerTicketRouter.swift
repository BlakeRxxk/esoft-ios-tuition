//
//  SellerTicketRouter.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 18/06/2020.
//

import Foundation
import UIKit

public protocol SellerTicketRouter: AnyObject {
  func routeToEditSellerPrice(sellerTicketID: Int)
}
