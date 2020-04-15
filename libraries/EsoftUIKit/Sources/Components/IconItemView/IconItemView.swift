//
//  IconItemView.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import BaseUI
import BaseFRP

public final class IconItemView: View {
  public var viewUUID: String = UUID().uuidString

  public var title: String {
    get {
      titleLabel.text ?? ""
    }
    set {
      titleLabel.text = newValue
    }
  }
  
  public var leftIcon: UIImage? {
    get {
      iconView.image
    }
    set {
      iconView.image = newValue ?? UIImage()
    }
  }

  private(set) lazy var containerStack: UIStackView = UIStackView()
  private(set) lazy var iconView: UIImageView = UIImageView()
  private(set) lazy var titleLabel: UILabel = UILabel()
  
  private var activeConstraints: [NSLayoutConstraint] = []

  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    let subviews: [UIView] = [
      containerStack,
      iconView,
      titleLabel
    ]
    
    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }

    containerStack.addArrangedSubview(iconView)
    containerStack.addArrangedSubview(titleLabel)
    
    addSubview <^> [
      containerStack
    ]
  }

  private func configureUI() {
    iconView.image = UIImage.Call.right
    
    iconView.tintColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
    containerStack.alignment = .center
    containerStack.axis = .horizontal
    containerStack.spacing = 32.0
    containerStack.isLayoutMarginsRelativeArrangement = true
    containerStack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    titleLabel.textColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
    titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineHeightMultiple = 1.08
    
    titleLabel.attributedText = NSMutableAttributedString(string: "title",
                                                          attributes: [
                                                            NSAttributedString.Key.kern: -0.41,
                                                            NSAttributedString.Key.paragraphStyle: paragraphStyle])
  }
  
  private func layout() {
    activeConstraints = [
      containerStack.topAnchor.constraint(equalTo: topAnchor),
      containerStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      containerStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      containerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      iconView.heightAnchor.constraint(equalToConstant: Space.base),
      iconView.widthAnchor.constraint(equalToConstant: Space.base)
    ]
    
    NSLayoutConstraint.activate(activeConstraints)
  }
  
  @objc func handleAction() {}
}

extension IconItemView: IconItemViewInput {}
