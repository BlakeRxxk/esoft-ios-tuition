//
//  AuthCityView.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import UIKit
import YogaKit
import BaseUI
import ThemeManager

public final class AuthCityView: View {
  public var name: String {
    get {
      nameLabel.text ?? ""
    }
    set{
      nameLabel.styledText = newValue
    }
    
  }
  // Принимать на вход сразу строку?
  public var regions: [String] {
    get {
      regionsLabel.text?.components(separatedBy: ",") ?? []
    }
    set{
      regionsLabel.styledText = newValue.joined(separator: ", ")
    }
    
  }
  public var isComingSoon: Bool = true {
    didSet {
      updateControlElements()
    }
  }
  
  private(set) lazy var leftContentView: UIView = UIView()
  private(set) lazy var nameLabel: UILabel = UILabel()
  private(set) lazy var regionsLabel: UILabel = UILabel()
  private(set) lazy var comingSoonLabel: UILabel = UILabel()
  
  internal lazy var layoutController: LayoutController = LayoutController()
  internal lazy var layout: Layout = Layout()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    configureLayout(block: layout.container)
    
    leftContentView.configureLayout(block: layout.leftContentView)
    nameLabel.configureLayout(block: layout.nameLabel)
    regionsLabel.configureLayout(block: layout.regionsLabel)
    comingSoonLabel.configureLayout(block: layout.comingSoonLabel)
    
    yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    [
      nameLabel,
      regionsLabel
      ].forEach { leftContentView.addSubview($0) }
    
    [
      leftContentView,
      comingSoonLabel
      ].forEach { self.addSubview($0) }
  }
  
  private func configureUI() {
    nameLabel.setStyles(
      UILabel.Styles.regular,
      UILabel.ColorStyle.primary,
      UILabel.Styles.singleLine
    )
    
    regionsLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.placeholders,
      UILabel.Styles.doubleLine
    )
    
    comingSoonLabel.setStyles(
      UILabel.Styles.alignCenter,
      UILabel.Styles.singleLine,
      UILabel.ColorStyle.inverse
    )
    
    // Запокавать в стили
    comingSoonLabel.font = UIFont._14
    comingSoonLabel.layer.cornerRadius = 12
    comingSoonLabel.layer.masksToBounds = true
    comingSoonLabel.backgroundColor = UIColor.Color.sienna500
    
    comingSoonLabel.styledText = Localized.comingSoon
  }
  
  private func updateControlElements() {
    updateComingSoonLabel()
    updateRegionsLabel()
    
    // Куда переместить?
    if isComingSoon {
      nameLabel.setStyles(UILabel.ColorStyle.placeholders)
    }
  }
}

private extension AuthCityView {
  enum Localized {
    static let comingSoon = "Скоро!"
  }
}
