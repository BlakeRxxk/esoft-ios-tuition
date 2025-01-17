//
//  InputPresenter.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

public protocol InputPresenterStyle {
  /// The maximum length of text input without formatting.
  var maximalLength: Int { get }
  
  /// Remove formatting and trash from string.
  ///
  /// - note: The method can be invoked on the part of the string.
  ///
  /// - parameter string: The string to remove the formatting.
  ///
  /// - returns: String with removed all the superfluous characters.
  func removedFormatting(from string: String) -> String
  
  /// Adds formatting to the string.
  ///
  /// - note: The method can be invoked on the prefix of the string.
  ///
  /// - parameter string: The string to add formatting.
  ///
  /// - returns: A string with applied formatting.
  func appendedFormatting(to string: String) -> String
}

public class InputPresenter: NSObject {
  public weak var output: InputView?
  
  let style: InputPresenterStyle
  
  public init(textInputStyle style: InputPresenterStyle) {
    self.style = style
  }
  
  public func input(changeCharactersIn range: NSRange,
                    replacementString replacement: String,
                    currentString current: String) {
    
    guard let output = output,
      var selectedRange = output.selectedRange,
      range.length >= 0 || range.location != 0 else {
        return
    }
    
    var replacement = style.removedFormatting(from: replacement)
    
    var range = range
    
    if replacement.isEmpty && selectedRange.length == 0 && range.length == 1 {
      selectedRange.length = Constants.backspaceLength
      range = selectedRange
    }
    
    var current = current
    guard let index = current.index(current.startIndex,
                                    offsetBy: range.location,
                                    limitedBy: current.endIndex) else {
                                      return
    }
    
    let prefix = style.removedFormatting(from: String(current[..<index]))
    let requirementPrefix = prefix.isEmpty ? String(current[..<index]) : prefix
    current = requirementPrefix + String(current[index...])
    
    range.location = requirementPrefix.count
    
    if range.length == Constants.backspaceLength {
      range.location -= 1
      range.length = 1
    }
    
    trimReplacementStringIfNeeded(changeCharactersIn: range,
                                  replacementString: &replacement,
                                  currentString: current)
    
    let finishString = (current as NSString).replacingCharacters(in: range, with: replacement)
    let clearFinishString = style.removedFormatting(from: finishString)
    output.inputText = style.appendedFormatting(to: clearFinishString)
    
    updateCursor(changeCharactersIn: range, replacementString: replacement, currentString: current)
  }
  
  private func prefixString(changeCharactersIn range: NSRange,
                            currentString current: String) -> String {
    guard let index = current.index(current.startIndex,
                                    offsetBy: range.location,
                                    limitedBy: current.endIndex) else {
                                      return style.removedFormatting(from: current)
    }
    return style.removedFormatting(from: String(current[..<index]))
  }
  
  private func suffixString(changeCharactersIn range: NSRange,
                            currentString current: String) -> String {
    guard let index = current.index(current.startIndex,
                                    offsetBy: range.location + range.length,
                                    limitedBy: current.endIndex) else {
                                      return style.removedFormatting(from: current)
    }
    return style.removedFormatting(from: String(current[index...]))
  }
  
  private func trimReplacementStringIfNeeded(changeCharactersIn range: NSRange,
                                             replacementString replacement: inout String,
                                             currentString current: String) {
    let prefix = prefixString(changeCharactersIn: range, currentString: current)
    let suffix = suffixString(changeCharactersIn: range, currentString: current)
    
    let safeLength = prefix.count + suffix.count
    guard safeLength < style.maximalLength else {
      replacement = ""
      return
    }
    let replacementLength = replacement.count
    if safeLength + replacementLength > style.maximalLength {
      let index = replacement.index(replacement.startIndex, offsetBy: style.maximalLength - safeLength)
      replacement = String(replacement[..<index])
    }
  }
  
  private func updateCursor(changeCharactersIn range: NSRange,
                            replacementString replacement: String,
                            currentString current: String) {
    guard let output = output else {
      return
    }
    
    let prefix = prefixString(changeCharactersIn: range, currentString: current)
    let prefixWithReplacement = style.appendedFormatting(to: prefix + replacement)
    
    guard let cursorPosition = output.position(from: output.beginningOfDocument,
                                               offset: prefixWithReplacement.count) else {
                                                return
    }
    output.selectedTextRange = output.textRange(from: cursorPosition, to: cursorPosition)
  }
}

// MARK: - Constants
private extension InputPresenter {
  enum Constants {
    static let backspaceLength = -1
  }
}
