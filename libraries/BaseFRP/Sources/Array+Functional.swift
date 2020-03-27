//
//  Array+Functional.swift
//  BaseFRP
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

// MARK: - Array functor
/// An infix synonym for `map(_:)`.
///
/// The name of this operation is allusion to `^`.
/// Note the similarities between their types:
///
///      (^)  : (T -> U)      T  ->  U
///     (<^>) : (T -> U) ->  [T] -> [U]
///
@discardableResult
public func <^><T, U>(_ transform: (T) -> U, _ arg: [T]) -> [U] {
  arg.map(transform)
}

/// The function apply function to all arguments.
///
/// - Parameters:
///     - transform: The function to be applied to the arguments.
///     - arg1: The first argument.
///     - arg2: The second argument.
/// - Returns: Array of applying function to arguments.
public func liftA2<T, U, V>(_ transform: (T, U) -> V,
                            _ arg1: [T],
                            _ arg2: [U]) -> [V] {
  arg1.flatMap { arg1 in arg2.map { transform(arg1, $0) } }
}

/// The function apply function to all arguments.
///
/// - Parameters:
///     - transform: The function to be applied to the arguments.
///     - arg1: The first argument.
///     - arg2: The second argument.
///     - arg3: The third argument.
/// - Returns: Array of applying function to arguments.
public func liftA3<T, U, V, W>(_ transform: (T, U, V) -> W,
                               _ arg1: [T],
                               _ arg2: [U],
                               _ arg3: [V]) -> [W] {
  arg1.flatMap { arg1 in
    arg2.flatMap { arg2 in
      arg3.map {
        transform(arg1, arg2, $0)
      }
    }
  }
}
