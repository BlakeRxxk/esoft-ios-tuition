//
//  UIButton+Style.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit
import YogaKit
import Atlas
import ThemeManager

// MARK: - Styles
extension UIButton {
  
  public enum Styles {
    // MARK: - Main styles
    public static let primary = primaryTextColors + Style(name: "primary") { (button: UIButton) in
      let tintColor: UIColor = ThemeManager.current().colors.primary500
      let highlightedColor: UIColor = ThemeManager.current().colors.primary400
      let disabledColor: UIColor = ThemeManager.current().colors.primary300
      
      button.setBackgroundImage(roundedBackground(color: tintColor, cornerRadius: Space.base), for: .normal)
      button.setBackgroundImage(roundedBackground(color: highlightedColor, cornerRadius: Space.base), for: .highlighted)
      button.setBackgroundImage(roundedBackground(color: disabledColor, cornerRadius: Space.base), for: .disabled)
      
      button.configureLayout { layout in
        layout.height = YGValue.large
        layout.paddingHorizontal = YGValue.base
      }
    }
    
    public static let accent = primaryTextColors + Style(name: "accent") { (button: UIButton) in
      let tintColor: UIColor =  ThemeManager.current().colors.accent500
      let highlightedColor: UIColor = ThemeManager.current().colors.accent400
      let disabledColor: UIColor = ThemeManager.current().colors.accent300
      
      button.setBackgroundImage(roundedBackground(color: tintColor, cornerRadius: Space.base), for: .normal)
      button.setBackgroundImage(roundedBackground(color: highlightedColor, cornerRadius: Space.base), for: .highlighted)
      button.setBackgroundImage(roundedBackground(color: disabledColor, cornerRadius: Space.base), for: .disabled)
      
      button.configureLayout { layout in
        layout.height = YGValue.large
        layout.paddingHorizontal = YGValue.base
      }
    }
    
    public static let link = Style(name: "link") { (button: UIButton) in
      let tintColor: UIColor = ThemeManager.current().colors.system
      let highlightedColor: UIColor = ThemeManager.current().colors.systemHighlighted
      
      button.setTitleColor(tintColor, for: .normal)
      button.setTitleColor(highlightedColor, for: .highlighted)
      button.setTitleColor(.highlighted(from: tintColor, alpha: 0.5), for: .disabled)
      
      button.titleLabel?.font = UIFont.regular
      button.contentHorizontalAlignment = .left
    }
    
    public static let linkPrimary = Style(name: "link.primary") { (button: UIButton) in
      let tintColor: UIColor = ThemeManager.current().colors.primary500
      let highlightedColor: UIColor = ThemeManager.current().colors.primary400
      
      button.setTitleColor(tintColor, for: .normal)
      button.setTitleColor(highlightedColor, for: .highlighted)
      button.setTitleColor(.highlighted(from: tintColor, alpha: 0.5), for: .disabled)
      
      button.titleLabel?.font = UIFont.regular
      button.contentHorizontalAlignment = .left
    }
    
    public static let linkPrimarySmall = Style(name: "link.primary.small") { (button: UIButton) in
      let tintColor: UIColor = ThemeManager.current().colors.primary500
      let highlightedColor: UIColor = ThemeManager.current().colors.primary400
      
      button.setTitleColor(tintColor, for: .normal)
      button.setTitleColor(highlightedColor, for: .highlighted)
      button.setTitleColor(.highlighted(from: tintColor, alpha: 0.5), for: .disabled)
      
      button.titleLabel?.font = UIFont.small
      button.contentHorizontalAlignment = .left
    }
    
    public static let linkOutline = Style(name: "link.outline") { (button: UIButton) in
      let tintColor: UIColor = ThemeManager.current().colors.divider
      let highlightedColor: UIColor = ThemeManager.current().colors.systemHighlighted
      
      button.setTitleColor(tintColor, for: .normal)
      button.setTitleColor(.highlighted(from: tintColor), for: .highlighted)
      button.setTitleColor(ThemeManager.current().textColors.secondary, for: .selected)
      
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.topBar, cornerRadius: Space.base / 2), for: .highlighted)
      
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.screen, cornerRadius: Space.base / 2), for: .selected)
      
      button.titleLabel?.font = UIFont.smallSemibold
      button.configureLayout { layout in
        layout.height = YGValue.base
        layout.paddingHorizontal = YGValue.small
      }
    }
    
    public static let outline = outlineTextColors + Style(name: "outline.primary") { (button: UIButton) in
      button.clipsToBounds = true
      button.layer.cornerRadius = Space.base / 2
      button.layer.borderColor = ThemeManager.current().colors.primary500.cgColor
      button.layer.borderWidth = 1.0
      
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.topBar, cornerRadius: Space.base / 2), for: .highlighted)
      
      button.configureLayout { layout in
        layout.height = YGValue.base
        layout.paddingHorizontal = YGValue.small
      }
    }
    
    public static let fab = Style(name: "fab") { (button: UIButton) in
      let tintColor: UIColor = button.tintColor
      let cornerRadius = Space.base
      
      if let image = button.image(for: .normal) {
        button.setColorizedImage(image, color: tintColor, for: .normal)
        button.setColorizedImage(image, color: .highlighted(from: tintColor), for: .highlighted)
        button.setColorizedImage(image, color: .highlighted(from: tintColor, alpha: 0.5), for: .disabled)
      }
      
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.container, cornerRadius: cornerRadius), for: .normal)
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.fabHighlighted, cornerRadius: cornerRadius), for: .highlighted)
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.container, cornerRadius: cornerRadius), for: .disabled)
      
      button.clipsToBounds = true
      button.layer.cornerRadius = cornerRadius
      button.layer.borderColor = ThemeManager.current().colors.divider.cgColor
      button.layer.borderWidth = 0.5
      
      button.configureLayout { layout in
        layout.height = YGValue.large
        layout.width = YGValue.large
      }
    }
    
    public static let cardActions = Style(name: "cardActions") { (button: UIButton) in
      let tintColor: UIColor = button.tintColor
      
      if let image = button.image(for: .normal) {
        button.setColorizedImage(image, color: tintColor, for: .normal)
        button.setColorizedImage(image, color: .highlighted(from: tintColor), for: .highlighted)
        button.setColorizedImage(image, color: .highlighted(from: tintColor, alpha: 0.5), for: .disabled)
      }
      
      button.configureLayout { layout in
        layout.height = YGValue.large
        layout.width = YGValue.large
      }
    }
    
    public static let fabShadow = fab + Style(name: "fab.shadow") { (button: UIButton) in
      button.appendStyle(UIView.Styles.shadowFab)
      
      if button.isHighlighted {
        button.layer.shadowOpacity = 0.2
      }
      if !button.isEnabled {
        button.layer.shadowOpacity = 0.06
      }
    }
    
    public static let flat = Style(name: "flat") { (button: UIButton) in
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.container, cornerRadius: 0), for: .normal)
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.fabHighlighted, cornerRadius: 0), for: .highlighted)
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.container, cornerRadius: 0), for: .disabled)
      
      let colorsByStates: [(state: UIControl.State, foreground: UIColor)] = [
        (.normal, ThemeManager.current().textColors.primary),
        (.highlighted, ThemeManager.current().textColors.primary),
        (.disabled, UIColor.highlighted(from: ThemeManager.current().textColors.primary, alpha: 0.5))
      ]
      
      colorsByStates.forEach { (state: UIControl.State, color: UIColor) in
        let attributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.regularSemibold,
          .foregroundColor: color
        ]
        let attributedString = button.title(for: state).map {
          NSAttributedString(string: $0, attributes: attributes)
        }
        button.setAttributedTitle(attributedString, for: state)
      }
      
      button.titleLabel?.lineBreakMode = .byTruncatingTail
      
      button.clipsToBounds = true
      button.configureLayout { layout in
        layout.height = YGValue.large
        layout.paddingHorizontal = YGValue.base
      }
      button.addBorders()
    }
    
    static let primaryTextColors = Style(name: "primary.text.colors") { (button: UIButton) in
      let colorsByStates: [(state: UIControl.State, foreground: UIColor)] = [
        (.normal, ThemeManager.current().textColors.white),
        (.highlighted, UIColor.highlighted(from: ThemeManager.current().textColors.white)),
        (.disabled, ThemeManager.current().textColors.white)
      ]
      
      colorsByStates.forEach { (state: UIControl.State, color: UIColor) in
        let attributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.regularSemibold,
          .foregroundColor: color
        ]
        let attributedString = button.title(for: state).map {
          NSAttributedString(string: $0, attributes: attributes)
        }
        button.setAttributedTitle(attributedString, for: state)
      }
      
      button.titleLabel?.lineBreakMode = .byTruncatingTail
    }
    
    static let outlineTextColors = Style(name: "outline.text.colors") { (button: UIButton) in
      let tintColor: UIColor = ThemeManager.current().colors.primary500
      let highlightedColor: UIColor = ThemeManager.current().colors.primary400
      let disabledColor: UIColor = ThemeManager.current().colors.primary300
      
      let colorsByStates: [(state: UIControl.State, foreground: UIColor)] = [
        (.normal, tintColor),
        (.highlighted, highlightedColor),
        (.disabled, disabledColor)
      ]
      
      colorsByStates.forEach { (state: UIControl.State, color: UIColor) in
        let attributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.smallSemibold,
          .foregroundColor: color
        ]
        let attributedString = button.title(for: state).map {
          NSAttributedString(string: $0, attributes: attributes)
        }
        button.setAttributedTitle(attributedString, for: state)
      }
      
      button.titleLabel?.lineBreakMode = .byTruncatingTail
    }
    
    public static let brand = Style(name: "brand") { (button: UIButton) in
      let tintColor: UIColor = ThemeManager.current().textColors.white
      
      button.setTitleColor(tintColor, for: .normal)
      button.tintColor = tintColor
      
      button.titleLabel?.font = UIFont.regularSemibold
      
      button.setBackgroundImage(roundedBackground(color: ThemeManager.current().colors.brand, cornerRadius: 20), for: .normal)
    }
    
    /**
     Generate rounded image for button background.
     
     - Parameters:
     - color: UIColor for background
     - cornerRadius: given corner radius, by default = 0
     - Returns: UIImage with rounded corners
     */
    static func roundedBackground(color: UIColor, cornerRadius: CGFloat = 0) -> UIImage {
      let side = cornerRadius * 2 + 2
      let size = CGSize(width: side, height: side)
      
      return UIImage.image(color: color)
        .scaled(to: size)
        .rounded(cornerRadius: cornerRadius)
        .resizableImage(withCapInsets: UIEdgeInsets(top: cornerRadius,
                                                    left: cornerRadius,
                                                    bottom: cornerRadius,
                                                    right: cornerRadius))
    }
  }
}

extension UIButton {
  func setColorizedImage(_ image: UIImage,
                         color: UIColor,
                         for state: UIControl.State) {
    let colorizedImage = image.colorizedImage(color: color)
    self.setImage(colorizedImage, for: state)
  }
}

extension UIButton {
  public func addBorders() {
    let topBorder = UIView()
    topBorder.appendStyle(UIView.Styles.divider)
    topBorder.configureLayout { layout in
      layout.position = .absolute
      layout.top = YGValueZero
      layout.left = YGValueZero
      layout.right = YGValueZero
      layout.isEnabled = true
    }
    
    let bottomBorder = UIView()
    bottomBorder.appendStyle(UIView.Styles.divider)
    bottomBorder.configureLayout { layout in
      layout.position = .absolute
      layout.bottom = YGValueZero
      layout.left = YGValueZero
      layout.right = YGValueZero
      layout.isEnabled = true
    }
    
    addSubview(topBorder)
    addSubview(bottomBorder)
  }
  
  public func loading(_ show: Bool) {
    let tag = 9876
    let originalText = titleLabel?.text
    
    if show {
      isUserInteractionEnabled = false
      setStyledTitle("", for: .normal)
      
      let indicator = UIActivityIndicatorView()
      indicator.tag = tag
      indicator.color = ThemeManager.current().textColors.white
      indicator.translatesAutoresizingMaskIntoConstraints = false
      
      addSubview(indicator)
      NSLayoutConstraint.activate([
        centerX.constraint(equalTo: indicator.centerX),
        centerY.constraint(equalTo: indicator.centerY)
      ])
      
      indicator.startAnimating()
      
    } else {
      if let indicator = viewWithTag(tag) as? UIActivityIndicatorView {
        indicator.stopAnimating()
        indicator.removeFromSuperview()
        
        setStyledTitle(originalText, for: .normal)
        isUserInteractionEnabled = true
      }
    }
  }
}
