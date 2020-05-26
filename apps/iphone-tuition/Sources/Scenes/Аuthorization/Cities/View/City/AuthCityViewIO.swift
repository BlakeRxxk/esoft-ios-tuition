//
//  AuthCityViewIO.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation

public protocol AuthCityInput {
  var name: String { get set }
  var regions: [String] { get set }
  var isComingSoon: Bool { get set }
}
