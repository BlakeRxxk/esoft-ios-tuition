//
//  SpecialistsListState.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import StateKit
import ObjectsCore

public final class ObjectsListState: Store {
  public let initialState: ObjectsListState.State
  private let objectsUseCase: ObjectsUseCase
  
  public init(objectsUseCase: ObjectsUseCase) {
    self.objectsUseCase = objectsUseCase
    
    initialState = State()
  }
}

extension ObjectsListState {
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var objects: [Object] = []
//    public var page: Int = 1
//    public var pages: Int = 1
    public var scope: ObjectsScope = .all
  }
  
  public enum Action {
    case fetchObjects
    case refreshMyObjects
  }
  
  public enum Mutation {
    case setInitialLoading(_ condition: Bool = false)
    case setObjects([Object] = [])
    case appendObjects([Object] = [])
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
      
    case .fetchObjects:
      return Observable.merge([
        .just(.setInitialLoading(true)),
        objectsUseCase
          .invoke(request: ObjectsRequest())
          .map { .appendObjects($0) }
      ])
      
    case .refreshMyObjects:
      return Observable.merge([
        .just(.setInitialLoading(false)),
        objectsUseCase
          .invoke(request: ObjectsRequest())
          .map { .setObjects($0) }
      ])
      
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .setObjects(objects):
      var newState = state
      newState.initialLoading = false
      newState.objects = objects
      return newState
    case let .appendObjects(objects):
      var newState = state
      newState.initialLoading = false
      newState.objects.append(contentsOf: objects)
      return newState
    case let .setInitialLoading(condition):
      var newState = state
      newState.initialLoading = condition
      return newState
    }
  }
  
}
