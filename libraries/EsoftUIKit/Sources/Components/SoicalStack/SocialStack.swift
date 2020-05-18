//
//  SocialStack.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit
import YogaKit
import BaseUI

public final class SocialStack: View {
  public var socialList: [SocialProviders] {
    get {
      return socialButtons.map { SocialProviders(rawValue: $0.tag)! }
    }
    set(socialList) {
      socialButtons.forEach {layoutController.hide($0)}
      socialButtons = socialList.map {
        var button = SocialButtonBuilder().build(social: $0)
        button.addTarget(self, action: #selector(socialDidPressed), for: .touchUpInside)
        return button
      }
      socialButtons.forEach {
        addSubview($0)
      }
      
      // Перерисовать
//      self.yoga.markDirty() // ошибка
      self.setNeedsLayout() // Надо?
    }
  }
  
  private(set) var socialButtons: [UIButton] = []
  
  public weak var output: SocialStackOutput?
  private var layoutController: LayoutController = LayoutController()
  internal lazy var layout: Layout = Layout()
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout(block: layout.container)

    socialButtons.forEach {
      $0.configureLayout(block: layout.socialIcon)
    }

    yoga.applyLayout(preservingOrigin: true)
  }
  
  @objc private func socialDidPressed(sender: UIButton!) {
    guard let social = SocialProviders(rawValue: sender.tag) else { return }
    output?.didTapSocial(social: social)
  }
}

extension SocialStack: SocialStackInput {
  
}
