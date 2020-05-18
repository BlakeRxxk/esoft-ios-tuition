//
//  SocialButtonBuilder.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by nedstar on 18.05.2020.
//

import UIKit

public enum SocialProviders: Int {
  case vk = 0
  case ok = 1
  case google = 2
  case facebook = 3
  
  public func getImage() -> UIImage {
    switch self {
    case .vk:
      return UIImage.Socials.vk
    case .ok:
      return UIImage.Socials.ok
    case .google:
      return UIImage.Socials.google
    case .facebook:
      return UIImage.Socials.facebook
    }
  }
}

class SocialButtonBuilder {
  private var button: UIButton
  
  init() {
    self.button = UIButton()
  }
  
  private func set(icon: UIImage) -> SocialButtonBuilder {
    self.button.setImage(icon, for: .normal)
    
    return self
  }
  
  private func set(tag: Int) -> SocialButtonBuilder {
    self.button.tag = tag
    
    return self
  }
  
  func build() -> UIButton {
    return self.button
  }
}

extension SocialButtonBuilder {
  func build(social: SocialProviders) -> UIButton {
    switch social {
    case .vk:
      return buildVKButton()
    case .ok:
      return buildOKButton()
    case .google:
      return buildGoogleButton()
    case .facebook:
      return buildFacebookButton()
    }
  }
  
  func buildVKButton() -> UIButton {
    return self
      .set(icon: SocialProviders.vk.getImage())
      .set(tag: SocialProviders.vk.rawValue)
      .build()
  }
  
  func buildOKButton() -> UIButton {
    return self
      .set(icon: SocialProviders.ok.getImage())
      .set(tag: SocialProviders.ok.rawValue)
      .build()
  }
  
  func buildGoogleButton() -> UIButton {
    return self
      .set(icon: SocialProviders.google.getImage())
      .set(tag: SocialProviders.google.rawValue)
      .build()
  }
  
  func buildFacebookButton() -> UIButton {
    return self
      .set(icon: SocialProviders.facebook.getImage())
      .set(tag: SocialProviders.facebook.rawValue)
      .build()
  }
}
