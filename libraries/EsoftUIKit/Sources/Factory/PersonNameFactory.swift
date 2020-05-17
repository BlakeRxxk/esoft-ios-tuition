//
//  PersonNameFactory.swift
//  ESUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public enum PersonNameFactory {
  public static let avatarOutputFormatter: PersonNameComponentsFormatter = {
    $0.style = .abbreviated
    return $0
  }(PersonNameComponentsFormatter())
  
  public static let defaultOutputFormatter: PersonNameComponentsFormatter = {
    $0.style = .default
    return $0
  }(PersonNameComponentsFormatter())
  
  public static func makeComponents(from fullname: String) -> PersonNameComponents {
    let splittedName = fullname.components(separatedBy: " ")
    
    var components = PersonNameComponents()
    if splittedName.count >= 2 {
      components.familyName = splittedName[1]
    }

    components.givenName = splittedName.first
    
    return components
  }
}
