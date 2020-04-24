//
//  SocialStack.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit
import YogaKit
import BaseUI

public final class SocialStack : View {
  public var facebookImage: UIImage {
    get {
      facebookButton.currentImage ?? UIImage()
    }
    set {
      facebookButton.setImage(newValue, for: .normal)
    }
  }
  public var vkImage: UIImage {
    get {
      vkButton.currentImage ?? UIImage()
    }
    set {
      vkButton.setImage(newValue, for: .normal)
    }
  }
  public var okImage: UIImage {
    get {
      okButton.currentImage ?? UIImage()
    }
    set {
      okButton.setImage(newValue, for: .normal)
    }
  }
  public var googleImage: UIImage {
    get {
      googleButton.currentImage ?? UIImage()
    }
    set {
      googleButton.setImage(newValue, for: .normal)
    }
  }
  
  private(set) lazy var container: UIView = UIView()
  
  private(set) lazy var facebookButton: UIButton = {
    $0.addTarget(self, action: #selector(facebookButtonDidPressed), for: .touchUpInside)
    return $0
  }(UIButton())
  private(set) lazy var vkButton: UIButton = {
    $0.addTarget(self, action: #selector(vkButtonDidPressed), for: .touchUpInside)
    return $0
  }(UIButton())
  private(set) lazy var okButton: UIButton = {
    $0.addTarget(self, action: #selector(okButtonDidPressed), for: .touchUpInside)
    return $0
  }(UIButton())
  private(set) lazy var googleButton: UIButton = {
    $0.addTarget(self, action: #selector(vkButtonDidPressed), for: .touchUpInside)
    return $0
  }(UIButton())
  
  public weak var output: SocialStackOutput?
  
  internal lazy var layout: Layout = Layout()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  private func createUI() {
    [
      facebookButton,
      vkButton,
      okButton,
      googleButton,
      ].forEach { container.addSubview($0) }
    
    addSubview(container)
  }
  
  private func configureUI() {
    // Default values
    facebookImage = UIImage.Socials.facebook
    vkImage = UIImage.Socials.vk
    okImage = UIImage.Socials.ok
    googleImage = UIImage.Socials.google
  }
  
  override public func configureLayout(block: @escaping YGLayoutConfigurationBlock) {
    
    container.configureLayout(block: layout.container)
    
    facebookButton.configureLayout(block: layout.socialIcon)
    vkButton.configureLayout(block: layout.socialIcon)
    okButton.configureLayout(block: layout.socialIcon)
    googleButton.configureLayout(block: layout.socialIcon)
    
    super.configureLayout(block: block)
  }
  
  @objc private func facebookButtonDidPressed() {
    output?.didTapFacebook()
  }
  @objc private func okButtonDidPressed() {
    output?.didTapVK()
  }
  @objc private func vkButtonDidPressed() {
    output?.didTapOK()
  }
  @objc private func googleButtonDidPressed() {
    output?.didTapGoogle()
  }
}

extension SocialStack : SocialStackInput {
  
}
