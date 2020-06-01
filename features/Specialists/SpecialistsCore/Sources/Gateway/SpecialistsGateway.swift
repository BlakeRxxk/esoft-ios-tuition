//
//  SpecialistsGateway.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

public protocol SpecialistsGateway {
  func getList(url: URL) -> Single<[Specialist]>
  func getListCount(url: URL) -> Single<SpecialistsCount>
}
