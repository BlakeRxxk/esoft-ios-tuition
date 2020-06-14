//
//  CitiesListState.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import StateKit
import AuthCore
import EsoftUIKit

public final class CitiesListState: Store {
  public let initialState: CitiesListState.State
  private let citiesUseCase: CitiesUseCase
  private let countriesUseCase: CountriesUseCase
  
  public init(citiesUseCase: CitiesUseCase,
              countriesUseCase: CountriesUseCase) {
    self.citiesUseCase = citiesUseCase
    self.countriesUseCase = countriesUseCase
    
    initialState = State()
  }
}

extension CitiesListState {
  public struct State: Equatable {
    public var isSearching: Bool = false
    public var filter: String?
    public var myCity: MyCity?
    public var countries: [Country : [City]] = [:]
    public var selectedCityId: Int?
  }
  
  public enum Action {
    case startSearching
    case stopSearching
    case changeFilter(String?)
    case fetchData
    case selectCity(Int)
  }
  
  public enum Mutation {
    case setSearching(Bool)
    case setFilter(String?)
    case setData([Country : [City]])
    case setSelectedCity(Int)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .startSearching:
      return .just(.setSearching(true))
    case .stopSearching:
      return .just(.setSearching(false))
    case let .changeFilter(filter):
      return .just(.setFilter(filter))
    case .fetchData:
      let countries = countriesUseCase.invoke(request: CountriesRequest())
      let cities = citiesUseCase.invoke(request: CitiesRequest())
      return Observable.combineLatest(countries, cities) { countries, cities in
        var dict = [Country : [City]]()
        for country in countries {
          dict[country] = cities.filter { country.id == $0.country }
        }
        return .setData(dict) }
    case let .selectCity(selectedCityId):
      return . just(.setSelectedCity(selectedCityId))
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setSearching(isSearching):
      newState.isSearching = isSearching
    case let .setFilter(filter):
      newState.filter = filter
    case let .setData(countries):
      newState.countries = countries
    case let .setSelectedCity(selectedCityId):
      newState.selectedCityId = selectedCityId
    }
    return newState
  }
}
