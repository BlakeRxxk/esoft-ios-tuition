//
//  SellerTicketListState.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import StateKit
import SellerTicketCore

public final class SellerTicketListState: Store {
  public let initialState: SellerTicketListState.State
  private let sellerTicketUseCase: SellerTicketUseCase
  
  public init(sellerTicketUseCase: SellerTicketUseCase) {
    self.sellerTicketUseCase = sellerTicketUseCase
    
    initialState = State()
  }
}

extension SellerTicketListState {
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var sellerTicket: SellerTicket?
    public var scope: SellerTicketScope = .all
  }
  
  public enum Action {
    case fetchSellerTicket
  }
  
  public enum Mutation {
    case setInitialLoading(_ condition: Bool = false)
    case appendSellerTicket(SellerTicket)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .fetchSellerTicket:
      return Observable.merge([
        .just(.setInitialLoading(true)),
        sellerTicketUseCase
          .invoke(request: SellerTicketRequest())
          .map { .appendSellerTicket($0) }
      ])
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .appendSellerTicket(sellerTicket):
      var newState = state
      newState.initialLoading = false
      newState.sellerTicket = sellerTicket
      return newState
    case let .setInitialLoading(condition):
      var newState = state
      newState.initialLoading = condition
      return newState
    }
  }
}
