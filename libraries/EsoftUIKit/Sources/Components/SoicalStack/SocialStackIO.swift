//
//  SocialStackIO.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit

public protocol SocialStackInput {
  var facebookImage: UIImage { get set }
  var vkImage: UIImage { get set }
  var okImage: UIImage { get set }
  var googleImage: UIImage { get set }
}

public protocol SocialStackOutput: AnyObject {
  func didTapFacebook()
  func didTapVK()
  func didTapOK()
  func didTapGoogle()
}
