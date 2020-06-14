//
//  SpecialistsGateway.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

public protocol CitiesGateway {
  func getList(url: URL) -> Single<[City]>
}
