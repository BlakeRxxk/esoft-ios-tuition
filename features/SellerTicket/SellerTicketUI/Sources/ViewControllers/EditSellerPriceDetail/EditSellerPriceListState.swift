//
//  EditSellerPriceListState.swift
//  SellerTicketImplementation#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

import StateKit
import SellerTicketCore

public final class EditSellerPriceListState: Store {
  public let initialState: EditSellerPriceListState.State
  private let editSellerPriceUseCase: EditSellerPriceUseCase
  
  public init(editSellerPriceUseCase: EditSellerPriceUseCase) {
    self.editSellerPriceUseCase = editSellerPriceUseCase
    
    initialState = State()
  }
}

extension EditSellerPriceListState {
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var recomendedPrice: [RecomendedPrice] = []
    public var scope: SellerTicketScope = .all
  }
  
  public enum Action {
    case fetchRecomendedPrice
    case fetchSellerTicket(id: Int)
  }
  
  public enum Mutation {
    case setInitialLoading(_ condition: Bool = false)
    case appendRecomendedPrice([RecomendedPrice] = [])
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .fetchRecomendedPrice:
      return Observable.merge([
        .just(.setInitialLoading(true)),
        editSellerPriceUseCase
          .invoke(request: EditSellerPriceRequest())
          .map { .appendRecomendedPrice($0) }
      ])
    case let .fetchSellerTicket(id):
      return .empty()
      
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .appendRecomendedPrice(recomendedPrice):
      var newState = state
      newState.initialLoading = false
      newState.recomendedPrice = recomendedPrice
      return newState
    case let .setInitialLoading(condition):
      var newState = state
      newState.initialLoading = condition
      return newState
    }
  }
}
