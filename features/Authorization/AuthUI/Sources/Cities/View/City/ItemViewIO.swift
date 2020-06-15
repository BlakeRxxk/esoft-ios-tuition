//
//  AuthCityViewIO.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation

public protocol ItemViewInput {
  var title: String {get set}
  var secondaryText: String? {get set}
  var lockSignText: String? {get set}
  var isSelected: Bool { get set }
}
