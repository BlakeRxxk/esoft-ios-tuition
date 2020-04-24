//
//  SocialStack.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit
import YogaKit
import BaseUI

public final class UnderScoredTextField : View {
  public weak var output: SocialStackOutput?
  
  internal lazy var layout: Layout = Layout()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  private func createUI() {
    [].forEach { addSubview($0) }
  }
  
  private func configureUI() {
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout(block: layout.container)
    
    yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
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

extension SocialStack : UnderScoredTextFieldInput {
  
}
