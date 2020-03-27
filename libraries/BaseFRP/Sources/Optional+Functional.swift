//
//  Optional+Functional.swift
//  BaseFRP
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

// MARK: - Optional functor
/// An infix synonym for `map(_:)`.
///
/// The name of this operation is allusion to `^`.
/// Note the similarities between their types:
///
///      (^)  : (T -> U)     T  -> U
///     (<^>) : (T -> U) ->  T? -> U?
///
/// __Examples__:
///
/// If you need call function when `Optional` is `some`:
///
///     let data = ... // Give data
///     let image = UIImage.init <^> data
@discardableResult
public func <^><T, U>(_ transform: (T) -> U, _ arg: T?) -> U? {
  arg.map(transform)
}

/// The function apply function to the unwrapped arguments if both `Optional`
/// is right.
///
/// __Example__:
///
///     let value: NSNumber? = 0.58
///     let text = liftA2(NumberFormatter.localizedString, value, .percent)
///     debugPrint(text) // prints Optional("58 %")
///
/// - Parameters:
///     - transform: The function to be applied to the arguments.
///     - arg1: The first argument.
///     - arg2: The second argument.
/// - Returns: `some` when both arguments are `some`, otherwise `none`.
public func liftA2<T, U, V>(_ transform: (T, U) -> V,
                            _ arg1: T?,
                            _ arg2: U?) -> V? {
  switch (arg1, arg2) {
  case (.some(let arg1), .some(let arg2)):
    return transform(arg1, arg2)
  default:
    return nil
  }
}

/// The function apply function to the unwrapped arguments if all `Optional`
/// is `some`.
///
/// - Seealso: `liftA2(_:_:_:)`
/// - Parameters:
///     - transform: The function to be applied to the arguments.
///     - arg1: The first argument.
///     - arg2: The second argument.
///     - arg3: The third argument.
/// - Returns: `some` when all arguments are `some`, otherwise `none`.
public func liftA3<T, U, V, W>(_ transform: (T, U, V) -> W,
                               _ arg1: T?,
                               _ arg2: U?,
                               _ arg3: V?) -> W? {
  switch (arg1, arg2, arg3) {
  case (.some(let arg1), .some(let arg2), .some(let arg3)):
    return transform(arg1, arg2, arg3)
  default:
    return nil
  }
}
