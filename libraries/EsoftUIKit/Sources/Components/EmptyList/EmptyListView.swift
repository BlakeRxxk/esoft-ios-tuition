//
//  EmptyListView.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import YogaKit
import BaseUI
import BaseFRP
import ThemeManager

public final class EmptyListView: View {
  public var title: String {
    set {
      stubTitle.styledText = newValue
      stubTitle.yoga.markDirty()
    }
    get {
      stubTitle.styledText ?? ""
    }
  }
  
  public var message: String {
    set {
      stubMessage.styledText = newValue
      stubMessage.yoga.markDirty()
    }
    get {
      stubMessage.styledText ?? ""
    }
  }
  
  public var image: UIImage {
    set {
      stubImage.image = newValue
      stubImage.yoga.markDirty()
    }
    get {
      stubImage.image ?? UIImage()
    }
  }
  
  public var actionTitle: String {
    set {
      stubActionButton.setStyledTitle(newValue, for: .normal)
      stubActionButton.yoga.markDirty()
    }
    get {
      stubActionButton.styledTitle(for: .normal) ?? ""
    }
  }
  
  public var actionButtonMode: EmptyListView.ActionButtonMode = .default {
    didSet {
      updateControlElements()
    }
  }
  
  public var adjustSafeArea: Bool = false {
    didSet {
      updateControlElements()
    }
  }
  
  public weak var output: EmptyListOutput?
  
  internal lazy var layout: Layout = Layout()
  internal lazy var layoutController: LayoutController = LayoutController()
  
  private(set) lazy var stubTitle: UILabel = UILabel()
  private(set) lazy var stubMessage: UILabel = UILabel()
  private(set) lazy var stubImage: UIImageView = UIImageView()
  private(set) lazy var stubActionButton: UIButton = {
    $0.setStyles(UIButton.Styles.primary)
    $0.addTarget(self, action: #selector(actionButtonDidPressed), for: .touchUpInside)
    return $0
  }(UIButton())
  private(set) lazy var stubContainer: UIView = UIView()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout(block: layout.container)
    
    stubContainer.configureLayout(block: layout.stubContainer)
    
    stubImage.configureLayout(block: layout.stubImage)
    stubTitle.configureLayout(block: layout.stubTitle)
    stubMessage.configureLayout(block: layout.stubMessage)
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    stubContainer.addSubview <^> [
      stubImage,
      stubTitle,
      stubMessage
    ]
    addSubview <^> [
      stubContainer,
      stubActionButton
    ]
  }
  
  private func configureUI() {
    stubImage.tintColor = ThemeManager.current().colors.icon
    
    stubTitle.setStyles(
      UILabel.Styles.smallSemibold,
      UILabel.ColorStyle.secondary,
      UILabel.Styles.alignCenter,
      UILabel.Styles.multiline
    )
    stubMessage.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.placeholders,
      UILabel.Styles.alignCenter,
      UILabel.Styles.multiline
    )
  }

  @objc private func actionButtonDidPressed() {
    output?.didTapActionButton(in: self)
  }
  
  private func updateControlElements() {
    updateActionButton()
  }
}

extension EmptyListView: EmptyListInput {}
