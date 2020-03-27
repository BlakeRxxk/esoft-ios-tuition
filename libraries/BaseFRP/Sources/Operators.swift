//
//  Operators.swift
//  BaseFRP
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

precedencegroup FunctorPrecedence {
  associativity: left
  higherThan: DefaultPrecedence
}

infix operator <^>: FunctorPrecedence
