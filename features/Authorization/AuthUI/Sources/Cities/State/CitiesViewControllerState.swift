//
//  CitiesViewControllerState.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 26.05.2020.
//

import StateKit

public final class CitiesViewControllerState: Store {
  public let initialState: CitiesViewControllerState.State
  
  public init() {
    initialState = State()
  }
}

extension CitiesViewControllerState {
  public struct State: Equatable {
    public var isSearching: Bool = false
    public var filter: String?
    public var countries: [Country] = []
  }
  
  public enum Action {
    case setCountries([Country])
    case changeFilter(String?)
    case startSearching
    case stopSearching
  }
  
  public enum Mutation {
    case setCountries([Country])
    case setSearching
    case setFilter(String?)
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .setCountries(countries):
      return .just(.setCountries(countries))
    case .startSearching:
      return .just(.setSearching)
    case .stopSearching:
      return .just(.setSearching)
    case let .changeFilter(filer):
      return .just(.setFilter(filer))
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setCountries(countries):
      newState.countries = countries
    case let .setFilter(filter):
      newState.filter = filter
    case .setSearching:
      newState.isSearching = !state.isSearching
    }
    return newState
  }
}
