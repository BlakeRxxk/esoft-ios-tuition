//
//  UILabel+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Atlas
import BaseFRP
import Foundation
import ThemeManager
import UIKit

extension UILabel {
  public enum Styles {
    public static let title1 = lineSpacingTitle1 + makeStyle(name: "title1", attributes: [
      .font: UIFont.title1,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let title2 = lineSpacingTitle2 + makeStyle(name: "title2", attributes: [
      .font: UIFont.title2,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let title3 = lineSpacingTitle3 + makeStyle(name: "title3", attributes: [
      .font: UIFont.title3,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let headline = lineSpacingRegular + makeStyle(name: "regular.semibold", attributes: [
      .font: UIFont.regularSemibold,
      .foregroundColor: ThemeManager.current().textColors.primary
//      .baselineOffset: 0.5
    ])
    
    public static let regular = lineSpacingRegular + makeStyle(name: "regular", attributes: [
      .font: UIFont.regular,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let small = lineSpacingSmall + makeStyle(name: "small", attributes: [
      .font: UIFont.small,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let smallSemibold = lineSpacingSmall + makeStyle(name: "small.semibold", attributes: [
      .font: UIFont.smallSemibold,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let tiny = lineSpacingTiny + makeStyle(name: "tiny", attributes: [
      .font: UIFont.tiny,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let micro = lineSpacingMicro + makeStyle(name: "micro", attributes: [
      .font: UIFont.micro,
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let uppercased = Style(name: "uppercased") { (label: UILabel) in
      guard let text = label.text,
        let attributedString = label.attributedText else { return }
      
      let attributedText = NSMutableAttributedString.init(attributedString: attributedString)
      let range = NSRange(location: 0, length: (text as NSString).length)
      attributedText.replaceCharacters(in: range, with: text.uppercased())
      label.attributedText = attributedText
    }
    
    public static let primary = makeStyle(name: "primary", attributes: [
      .foregroundColor: ThemeManager.current().textColors.primary
    ])
    
    public static let secondary = makeStyle(name: "secondary", attributes: [
      .foregroundColor: ThemeManager.current().textColors.secondary
    ])
    
    public static let disabled = makeStyle(name: "disabled", attributes: [
      .foregroundColor: ThemeManager.current().textColors.disabled
    ])
    
    public static let multiline = Style(name: "multiline") { (label: UILabel) in
      label.numberOfLines = 0
    }
    
    public static let singleLine = Style(name: "singleLine") { (label: UILabel) in
      label.numberOfLines = 1
    }
    
    public static let doubleLine = Style(name: "doubleLine") { (label: UILabel) in
      label.numberOfLines = 2
    }
    
    public static let tripleLine = Style(name: "tripleLine") { (label: UILabel) in
      label.numberOfLines = 3
    }
    
    public static let alignLeft = makeStyle(name: "alignLeft") {
      let paragraph = $0
      paragraph.alignment = .left
      return paragraph
    }
    
    public static let alignRight = makeStyle(name: "alignRight") {
      let paragraph = $0
      paragraph.alignment = .right
      return paragraph
    }
    
    public static let alignCenter = makeStyle(name: "alignCenter") {
      let paragraph = $0
      paragraph.alignment = .center
      return paragraph
    }
    
    public static let strikeThrough = makeStyle(name: "strikeThrough", attributes: [
      .strikethroughStyle: NSUnderlineStyle.single.rawValue,
      .baselineOffset: 0
    ])
    
    // line Spacing
    private static let lineSpacingTitle1 = makeStyle(name: "lineSpacingTitle1") {
      let paragraph = $0
      paragraph.minimumLineHeight = 41
      return paragraph
    }
    
    private static let lineSpacingTitle2 = makeStyle(name: "lineSpacingTitle2") {
      let paragraph = $0
      paragraph.minimumLineHeight = 32
      return paragraph
    }
    
    private static let lineSpacingTitle3 = makeStyle(name: "lineSpacingTitle3") {
      let paragraph = $0
      paragraph.minimumLineHeight = 24
      return paragraph
    }
    
    private static let lineSpacingRegular = makeStyle(name: "lineSpacingRegular") {
      let paragraph = $0
      paragraph.minimumLineHeight = 22
      return paragraph
    }
    
    private static let lineSpacingSmall = makeStyle(name: "lineSpacingSmall") {
      let paragraph = $0
      paragraph.minimumLineHeight = 20
      return paragraph
    }
    
    private static let lineSpacingTiny = makeStyle(name: "lineSpacingTiny") {
      let paragraph = $0
      paragraph.minimumLineHeight = 18
      return paragraph
    }
    
    private static let lineSpacingMicro = makeStyle(name: "lineSpacingMicro") {
      let paragraph = $0
      paragraph.minimumLineHeight = 12
      return paragraph
    }
  }
}

extension UILabel {
  public enum ColorStyle {
    private static let black = Style(name: "color.black") { (label: UILabel) in
      label.textColor = ThemeManager.current().textColors.primary
    }
    
    private static let gray = Style(name: "color.gray") { (label: UILabel) in
      label.textColor = ThemeManager.current().textColors.secondary
    }
    
    private static let placeholder = Style(name: "color.placeholder") { (label: UILabel) in
      label.textColor = ThemeManager.current().textColors.placeholder
    }
    
    private static let ghost = Style(name: "color.ghost") { (label: UILabel) in
      label.textColor = ThemeManager.current().textColors.disabled
    }
    
    private static let green = Style(name: "color.green") { (label: UILabel) in
      label.textColor = ThemeManager.current().colors.primary500
    }
    
    public static let primary = black
    public static let primary500 = green
    public static let secondary = gray
    public static let placeholders = placeholder
    public static let disabled = ghost
    
    public static let inverse = Style(name: "label.colorStyle.inverse") { (label: UILabel) in
      label.textColor = ThemeManager.current().textColors.white
    }
    
    public static let inverseTranslucent = Style(name: "label.colorStyle.inverseTranslucent") { (label: UILabel) in
      label.textColor = .highlighted(from: ThemeManager.current().textColors.white, alpha: 0.5)
    }
  }
}

private func makeStyle(name: String, attributes: [NSAttributedString.Key: Any]) -> Style {
  Style(name: name) { (label: UILabel) in
    label.attributedText = liftA2(makeAttributedString, label.attributedText, attributes)
  }
}

private func makeStyle(name: String,
                       paragraphModifier: @escaping (NSMutableParagraphStyle) -> NSParagraphStyle) -> Style {
  Style(name: name) { (label: UILabel) in
    guard let attributedText = NSMutableAttributedString.init <^> label.attributedText,
      attributedText.length > 0 else { return }
    let range = NSRange(location: 0, length: (attributedText.string as NSString).length)
    var paragraph = (attributedText.attribute(.paragraphStyle,
                                              at: 0,
                                              effectiveRange: nil) as? NSParagraphStyle) ?? .default
    // swiftlint:disable:next force_cast
    paragraph = paragraphModifier(paragraph.mutableCopy() as! NSMutableParagraphStyle)
    attributedText.addAttributes([.paragraphStyle: paragraph], range: range)
    label.attributedText = attributedText
  }
}

private func makeAttributedString(attributedString: NSAttributedString,
                                  attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
  let range = NSRange(location: 0, length: (attributedString.string as NSString).length)
  let attributedString = NSMutableAttributedString(attributedString: attributedString)
  attributedString.addAttributes(attributes, range: range)
  return attributedString
}
