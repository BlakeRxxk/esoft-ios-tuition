//
//  EditDescriptionControllerState.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import StateKit
import SellerTicketCore

public final class EditDescriptionControllerState: Store {
  public let initialState: EditDescriptionControllerState.State
  private let sellerTicketUseCase: SellerTicketUseCase
  
  public init(sellerTicketUseCase: SellerTicketUseCase) {
    self.sellerTicketUseCase = sellerTicketUseCase
    
    initialState = State()
  }
}

extension EditDescriptionControllerState {
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var desc: [Desc] = []
    public var scope: SellerTicketScope = .all
  }
  
  public enum Action {
    case fetchDesc
    case fetchSellerTicket(id: Int)
  }
  
  public enum Mutation {
    case setInitialLoading(_ condition: Bool = false)
    case appendDesc([Desc] = [])
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .fetchDesc:
      return Observable.merge([
        .just(.setInitialLoading(true)),
        sellerTicketUseCase
          .invoke(request: EditDescriptionRequest())
          .map { .appendDesc($0) }
      ])
    case let .fetchSellerTicket(id):
      return .empty()
      
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .appendDesc(desc):
      var newState = state
      newState.initialLoading = false
      newState.desc = desc
      return newState
    case let .setInitialLoading(condition):
      var newState = state
      newState.initialLoading = condition
      return newState
    }
  }
}
