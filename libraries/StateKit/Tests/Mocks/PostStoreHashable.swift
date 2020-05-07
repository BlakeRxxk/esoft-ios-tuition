//
//  PostStoreHashable.swift
//  StateKitTests
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import StateKit

final class PostStoreHashable: Store, Hashable {
  enum Action {
    case view
  }
  
  enum Mutation {
    case increaseViewCount
  }
  
  struct State: Hashable {
    var id: String
    var viewCount: Int
  }
  
  let initialState: State
  
  init(id: String, viewCount: Int) {
    self.initialState = State(id: id, viewCount: viewCount)
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .view:
      return .just(.increaseViewCount)
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> PostStoreHashable.State {
    var newState = state
    switch mutation {
    case .increaseViewCount:
      newState.viewCount += 1
    }
    return newState
  }
}
