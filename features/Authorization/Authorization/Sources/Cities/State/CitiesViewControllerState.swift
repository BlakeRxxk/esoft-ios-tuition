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
    case `init`
    case startSearching
    case stopSearching(String?)
  }
  
  public enum Mutation {
    case setInit
    case setSearching // startSearching?
    case setFilter(String?)
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .`init`:
      return .just(.setInit)
    case .startSearching:
      return .just(.setSearching)
    case let .stopSearching(filter):
      return .just(.setFilter(filter))
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .setInit:
      return state
    case let .setFilter(filter):
      newState.filter = filter
      print("new filter: \(filter)")
      newState.isSearching = false
    case .setSearching:
      newState.isSearching = true
    }
    return newState
  }
}
