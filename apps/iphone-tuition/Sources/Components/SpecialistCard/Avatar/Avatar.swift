//
//  Avatar.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import PINRemoteImage
import BaseUI
import BaseFRP
import EsoftUIKit

public final class Avatar: View {
  public var fullName: String? {
    didSet {
      guard let name = fullName else { return }
      updateInitials(fullName: name)
    }
  }
  
  public var imageURL: URL? {
    didSet {
      avatarView.pin_clearImages()
      guard let url = imageURL else { return }
      updateImageView(url: url)
    }
  }

  private(set) lazy var avatarView: UIImageView = UIImageView()
  
  private(set) lazy var initialsContainer: UIView = UIView()
  private(set) lazy var initialsLabel: UILabel = UILabel()
  
  internal lazy var layout: Layout = Layout()

  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  private func createUI() {
    initialsContainer.addSubview <^> [
      initialsLabel
    ]
    
    addSubview <^> [
      initialsContainer,
      avatarView
    ]
  }
  private func configureUI() {
    initialsLabel.setStyles(
      UILabel.Styles.title2,
      UILabel.ColorStyle.inverse,
      UILabel.Styles.alignCenter
    )
    
    initialsContainer.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.avatar
    )
    avatarView.setStyles(
      UIImageView.Styles.dynamicSize,
      UIView.Styles.avatar,
      UIView.Styles.whiteBackground
    )
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout(block: layout.container)
    initialsContainer.configureLayout(block: layout.initialsContainer)
    initialsLabel.configureLayout(block: layout.initialsLabel)
    avatarView.configureLayout(block: layout.avatarView)
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  private func updateImageView(url: URL) {
    avatarView.alpha = 0
    avatarView.pin_setImage(from: url) { [weak self] result in
      
      if result.requestDuration > 0.25 {
        UIView.animate(withDuration: 0.2, animations: {
          self?.avatarView.alpha = 1
        })
      } else {
        self?.avatarView.alpha = 1
      }
      
      if result.error != nil {
        self?.avatarView.alpha = 0
      }
    }
  }
  
  private func updateInitials(fullName: String) {
    let initials = PersonNameFormatter().format(input: fullName)
    
    initialsLabel.styledText = initials
    initialsLabel.yoga.markDirty()
  }
}

extension Avatar: AvatarInput {}
