//
//  StorageScheduler.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import RxSwift

private final class ThreadTarget: NSObject {
  @objc func threadEntryPoint() {
    let runLoop = RunLoop.current
    runLoop.add(NSMachPort(), forMode: RunLoop.Mode.default)
    runLoop.run()
  }
}

private final class Action: NSObject {
  private let action: () -> Void
  
  init(action: @escaping () -> Void) {
    self.action = action
  }
  
  @objc func performAction() {
    action()
  }
}

final class StorageScheduler: ImmediateSchedulerType {
  private let target: ThreadTarget
  private let thread: Thread
  
  init(threadName: String) {
    self.target = ThreadTarget()
    self.thread = Thread(target: target,
                         selector: #selector(ThreadTarget.threadEntryPoint),
                         object: nil)
    self.thread.name = threadName
    self.thread.start()
  }
  
  func schedule<StateType>(_ state: StateType, action: @escaping (StateType) -> Disposable) -> Disposable {
    let disposable = SingleAssignmentDisposable()
    
    var action: Action? = Action {
      if disposable.isDisposed { return }
      disposable.setDisposable(action(state))
    }
    
    action?.perform(#selector(Action.performAction),
                    on: thread,
                    with: nil,
                    waitUntilDone: false,
                    modes: [RunLoop.Mode.default.rawValue])
    
    let actionDisposable = Disposables.create {
      action = nil
    }
    
    return Disposables.create(disposable, actionDisposable)
  }
  
  deinit {
    thread.cancel()
  }
}
