//
//  SocialsCellIO.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import EsoftUIKit

public protocol SocialsCellInput {
  var socials: [SocialProviders] { get set }
}

public protocol SocialsCellOutput: AnyObject {
  func didTapSocial(social: SocialProviders)
}
