//
//  SocialsCell.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import UIKit
import YogaKit
import BaseUI
import ThemeManager
import EsoftUIKit
import ListKit
import IGListKit

public final class SocialsCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SocialsCellID"
  
  public var socials: [SocialProviders] = [] {
    didSet {
      socialStack.socialList = socials
    }
  }
  
  private(set) lazy var socialStackContainer: UIView = UIView()
  private(set) lazy var socialStack: SocialStack = SocialStack()
  
  public weak var output: SocialsCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createUI() {
    socialStackContainer.addSubview(socialStack)
    contentView.addSubview(socialStackContainer)
  }
  
  private func configureUI() {
    socialStack.output = self
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let containerSize = contentView.bounds.size
    contentView.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
    })
    socialStackContainer.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = 32
    })
    socialStack.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.paddingHorizontal = 51
    })
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension SocialsCell: SocialStackOutput {
  public func didTapSocial(social: SocialProviders) {
    self.output?.didTapSocial(social: social)
  }
}
