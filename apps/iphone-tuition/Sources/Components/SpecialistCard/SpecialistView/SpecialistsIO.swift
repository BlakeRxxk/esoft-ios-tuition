//
//  SpecialistsIO.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

public protocol SpecialistsInput {
  var fullName: String { get set }
  var position: String { get set }
  var avatarURL: URL? { get set }
}
