//
//  EditDescriptionControllerState.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import StateKit
import SellerTicketCore
import EsoftUIKit

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
//    public var sellerTicketID: Int = 0
    public var sellerTicket: SellerTicketViewModel?
    public var desc: String = ""
    public var error: Bool = false
    public var errorMessage: String = ""
  }
  
  public enum Action {
    case fetchSellerTicket(desc: String)
  }
  
  public enum Mutation {
    case setSellerTicket(sellerTicket: SellerTicketViewModel)
    case setError(message: String)
    case setDescription(String)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .fetchSellerTicket(desc):
//      return .empty()
      return .just(.setDescription(desc))
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setSellerTicket(sellerTicket):
      newState.error = false
      newState.errorMessage = ""
      newState.desc = sellerTicket.desc ?? ""
      newState.sellerTicket = sellerTicket
    case let .setError(message):
      newState.error = true
      newState.errorMessage = message
    case let .setDescription(desc):
      newState.desc = desc
    }
    return newState
  }
}
