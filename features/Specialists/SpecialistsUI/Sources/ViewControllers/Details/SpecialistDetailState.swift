//
//  SpecialistDetailState.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import StateKit
import SpecialistsCore
import EsoftUIKit

public final class SpecialistDetailState: Store {
  public var scheduler: Scheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated,
                                                                     leeway: .milliseconds(500))
  public let initialState: SpecialistDetailState.State
  private let specialistsUseCase: SpecialistsUseCase
  
  public init(specialistsUseCase: SpecialistsUseCase) {
    self.specialistsUseCase = specialistsUseCase
    
    initialState = State()
  }
}

extension SpecialistDetailState {
  
  public struct State: Equatable {
    public var specialistID: Int = 0
    public var specialist: SpecialistViewModel?
    public var error: Bool = false
    public var errorMessage: String = ""
  }
  
  public enum Action: Equatable {
    case fetchSpecialist(id: Int)
  }
  
  public enum Mutation {
    case setSpecialist(specialist: SpecialistViewModel)
    case setError(message: String)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .fetchSpecialist(id):
      return .empty()
      
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .setSpecialist(specialist):
      var newState = state
      newState.error = false
      newState.errorMessage = ""
      newState.specialistID = specialist.id
      newState.specialist = specialist
      return newState
    case let .setError(message):
      var newState = state
      newState.error = true
      newState.errorMessage = message
      return newState
    }
  }
}
