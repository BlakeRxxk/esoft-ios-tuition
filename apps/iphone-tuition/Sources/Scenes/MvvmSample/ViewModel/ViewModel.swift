//
//  ViewModel.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SpecialistsUI
import EsoftUIKit

protocol ViewModel: class {
  // Input
  var loadSpecialists: PublishRelay<()> { get }
  var refresh: PublishRelay<()> { get }
  
  // Output
  var specialists: BehaviorRelay<[SpecialistViewModel]> { get }
}
