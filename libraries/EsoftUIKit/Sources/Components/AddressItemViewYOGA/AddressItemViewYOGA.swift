//
//  AddressItemViewYOGA.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 20.04.2020.
//

import UIKit
import BaseUI
import ThemeManager
import YogaKit

public final class AddressItemViewYOGA: View {
  
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
  
  private(set) lazy var titleStack: UIView = UIView()
  private(set) lazy var mainTitle: UILabel = UILabel()
  private(set) lazy var phoneButton: UIButton = UIButton()
  
  override public init() {
     super.init()
     
     createUI()
     configureUI()
     layout()
   }
  
  private func createUI() {
    
    addSubview(titleStack)
    
    titleStack.addSubview(mainTitle)
    titleStack.addSubview(phoneButton)
  }
  
  private func configureUI() {
    
    mainTitle.numberOfLines = 0
    
    mainTitle.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.primary
    )
    
    phoneButton.setBackgroundImage(UIImage.Call.right, for: .normal)
    phoneButton.tintColor = ThemeManager.current().colors.primary500
  }
  
  private func layout() {
    
    titleStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.alignItems = .center
      layout.justifyContent = .spaceBetween
      layout.paddingBottom = 4
      layout.paddingTop = 8
      layout.height = 48
      layout.width = 100%
    }
    
    mainTitle.configureLayout { layout in
      layout.isEnabled = true
      layout.flexShrink = 1
      layout.width = 80%
    }
    
    phoneButton.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 24
      layout.height = 24
    }
    
  }
  
}

extension AddressItemViewYOGA: AddressItemViewInputYOGA {}
