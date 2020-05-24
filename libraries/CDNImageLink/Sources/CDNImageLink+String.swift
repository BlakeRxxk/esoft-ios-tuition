//
//  CDNImageLink+String.swift
//  CDNImageLink
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public extension String {
  var profile: String {
    CDNImageLink(self).set(type: .profile).set(size: .crop100x100).build()
  }
}
