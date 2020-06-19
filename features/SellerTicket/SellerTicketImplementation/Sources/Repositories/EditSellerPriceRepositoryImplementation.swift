//
//  EditSellerPriceRepositoryImplementation.swift
//  SellerTicketImplementation#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

import RxSwift
import Network
import SellerTicketCore

public final class EditSellerPriceRepositoryImplementation {
  private var editSellerPriceGateway: EditSellerPriceGateway
  
  public init(editSellerPriceGateway: EditSellerPriceGateway) {
    self.editSellerPriceGateway = editSellerPriceGateway
  }
}

extension EditSellerPriceRepositoryImplementation: EditSellerPriceRepository {
  public func getRecomendedPrice() -> Single<RecomendedPrice> {
    editSellerPriceGateway.getRecomendedPrice(url: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/recomendedPrice")!)
  }
}

