//
//  SellerTicketListState.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import StateKit
import SpecialistsCore

public final class SellerTicketListState: Store {
  
  public let initialState: SellerTicketListState.State
  
  public init() {
    
    initialState = State()
  }
}

extension SellerTicketListState {
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var specialists: [Specialist] = []
    public var page: Int = 1
    public var pages: Int = 1
    public var scope: SpecialistScope = .all
  }
  
  public enum Action {
    case refreshMySpecialists
  }
  
  public enum Mutation {
    case setError
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refreshMySpecialists:
      return .just(.setError)
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case .setError:
      var newState = state
      newState.initialLoading = true
      return newState
    }
  }
}
