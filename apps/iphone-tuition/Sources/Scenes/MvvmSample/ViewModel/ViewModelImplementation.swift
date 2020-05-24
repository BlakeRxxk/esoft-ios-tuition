//
//  ViewModel.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import IGListDiffKit.IGListDiffable
import SpecialistsUI
import EsoftUIKit

final class ViewModelImplementation: ViewModel {
  private let disposeBag = DisposeBag()

  private let networkService: CatalogsAPI
  
  public let loadSpecialists = PublishRelay<()>()
  public let refresh = PublishRelay<()>()
  
  public let specialists: BehaviorRelay<[SpecialistViewModel]> = BehaviorRelay(value: [])
  
  init(networkService: CatalogsAPI) {
    self.networkService = networkService

    refreshList()
    loadList()
  }

  func loadList() {
    let request = networkService.getSpecialists(url: Constants.list)
    
    loadSpecialists
      .flatMapLatest { request }
      .elements()
      .compactMap { $0.data }
      .map { $0.map { $0.asViewModel() } }
      .bind(to: specialists)
      .disposed(by: disposeBag)
  }
  
  func refreshList() {
    let refreshRequest = networkService.getSpecialists(url: Constants.refreshList)

    refresh
      .flatMapLatest { refreshRequest }
      .debug()
      .elements()
      .compactMap { $0.data }
      .map { $0.map { $0.asViewModel() } }
      .bind(to: specialists)
      .disposed(by: disposeBag)
  }
}

extension ViewModelImplementation {
  enum Constants {
    static let baseURL = URL(string: "https://developers.etagi.com/api/v2/")!
    static let list = URL(string: "https://developers.etagi.com/api/v2/staff?&api_key=demo_lk_ios&limit=3")!
    static let refreshList = URL(string: "https://developers.etagi.com/api/v2/staff?&api_key=demo_lk_ios&limit=5")!
    static let error = URL(string: "https://developers.etagi.com/api/v2/staff3?&api_key=demo_lk_ios&limit=3")!
  }
}
