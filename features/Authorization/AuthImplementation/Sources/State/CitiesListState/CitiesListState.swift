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
  private let myCityUseCase: MyCityUseCase
  
  public init(citiesUseCase: CitiesUseCase,
              countriesUseCase: CountriesUseCase,
              myCityUseCase: MyCityUseCase) {
    self.citiesUseCase = citiesUseCase
    self.countriesUseCase = countriesUseCase
    self.myCityUseCase = myCityUseCase
    
    initialState = State()
  }
}

extension CitiesListState {
  public struct State: Equatable {
    public var isLoading: Bool = false
    public var isSearching: Bool = false
    public var filter: String?
    public var isLocating: Bool = false
    public var myCity: MyCity?
    public var countries: [Country: [City]] = [:]
    public var selectedCityId: Int?
  }
  
  public enum Action {
    case startSearching
    case stopSearching
    case changeFilter(String?)
    case startLocating
    case stopLocating
    case changeMyCity(Double, Double)
    case refreshData
    case fetchData
    case selectCity(Int)
  }
  
  public enum Mutation {
    case setLoading(Bool)
    case setSearching(Bool)
    case setFilter(String?)
    case setLocating(Bool)
    case setMyCity(MyCity)
    case setData([Country : [City]])
    case setSelectedCity(Int?)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .startSearching:
      return .just(.setSearching(true))
    case .stopSearching:
      return .just(.setSearching(false))
    case let .changeFilter(filter):
      return .just(.setFilter(filter))
    case .startLocating:
      return .just(.setLocating(true))
    case .stopLocating:
      return .just(.setLocating(false))
    case let .changeMyCity(lat, lon):
      return myCityUseCase
        .invoke(request: MyCityRequest(coords: (lat, lon)))
        .map { .setMyCity($0) }
    case .refreshData:
      return Observable.merge([.just(.setLoading(true)), .just(.setLoading(false))])
    case .fetchData:
      let countries = countriesUseCase.invoke(request: CountriesRequest())
      let cities = citiesUseCase.invoke(request: CitiesRequest())
      return Observable.combineLatest(countries, cities) { countries, cities in
        var dict = [Country: [City]]()
        for country in countries {
          dict[country] = cities.filter { country.id == $0.country }
        }
        return .setData(dict)
      }
    case let .selectCity(selectedCityId):
      if currentState.countries.contains(where: { $0.value.contains(where: { $0.id == selectedCityId && $0.eOfficeId != nil }) }) {
        return .just(.setSelectedCity(selectedCityId))
      }
      return .just(.setSelectedCity(currentState.selectedCityId))
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setLoading(isLoading):
      newState.isLoading = isLoading
    case let .setSearching(isSearching):
      newState.isSearching = isSearching
    case let .setFilter(filter):
      newState.filter = filter
    case let .setLocating(isLocating):
      newState.isLocating = isLocating
    case let .setMyCity(myCity):
      newState.myCity = myCity
      newState.isLocating = false
    case let .setData(countries):
      newState.countries = countries
    case let .setSelectedCity(selectedCityId):
      newState.selectedCityId = selectedCityId
    }
    return newState
  }
}
