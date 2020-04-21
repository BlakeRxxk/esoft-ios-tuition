//
//  AddressItemView.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 20.04.2020.
//

import UIKit
import BaseUI
import ThemeManager

public final class AddressItemView: View {
  
  public var title: String {
    get {
       mainTitle.styledText ?? ""
    }
    set {
       mainTitle.styledText = newValue
    }
  }
  
  public var icon: UIImage? {
    get {
      phoneButton.currentImage
    }
    set {
      phoneButton.setBackgroundImage(newValue, for: .normal)
    }
  }
  
  private(set) lazy var titleStack: UIStackView = UIStackView()
  private(set) lazy var mainTitle: UILabel = UILabel()
  private(set) lazy var phoneButton: UIButton = UIButton()
  
  private var activeConstraints: [NSLayoutConstraint] = []
  
  override public init() {
     super.init()
     
     createUI()
     configureUI()
     layout()
   }
  
  private func createUI() {
    
    let subviews: [UIView] = [
      titleStack,
      mainTitle,
      phoneButton
    ]
  
    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    titleStack.addArrangedSubview(mainTitle)
    titleStack.addArrangedSubview(phoneButton)
    
    addSubview(titleStack)
    
  }
  
  private func configureUI() {
    
    titleStack.spacing = 60
    titleStack.alignment = .center
    mainTitle.numberOfLines = 0
    
    mainTitle.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.primary
    )
    
    phoneButton.setBackgroundImage(UIImage.Call.right, for: .normal)
    phoneButton.tintColor = ThemeManager.current().colors.primary500
    
    titleStack.isLayoutMarginsRelativeArrangement = true
    titleStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
  }
  
  private func layout() {
    
    activeConstraints = [
      titleStack.topAnchor.constraint(equalTo: topAnchor),
      titleStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      titleStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      titleStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      phoneButton.widthAnchor.constraint(equalToConstant: 24),
      phoneButton.heightAnchor.constraint(equalToConstant: 24)
    ]
    
    NSLayoutConstraint.activate(activeConstraints)
  }
  
}

extension AddressItemView: AddressItemViewInput {}
