//
//  SocialStackIO.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit

public protocol SocialStackInput {
  var socialList: [SocialProviders] { get set }
}

public protocol SocialStackOutput: AnyObject {
  func didTapSocial(social: SocialProviders)
}
