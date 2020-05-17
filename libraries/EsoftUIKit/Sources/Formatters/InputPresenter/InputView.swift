//
//  InputView.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit

public protocol InputView: class {
  var inputText: String? { get set }
  
  var beginningOfDocument: UITextPosition { get }
  var selectedTextRange: UITextRange? { get set }
  
  func offset(from: UITextPosition, to toPosition: UITextPosition) -> Int
  func position(from position: UITextPosition, offset: Int) -> UITextPosition?
  func textRange(from fromPosition: UITextPosition, to toPosition: UITextPosition) -> UITextRange?
}

extension InputView {
  
  public var selectedRange: NSRange? {
    guard let selectedTextRange = selectedTextRange else { return nil }
    let start = offset(from: beginningOfDocument, to: selectedTextRange.start)
    let length = offset(from: selectedTextRange.start, to: selectedTextRange.end)
    return NSRange(location: start, length: length)
  }
}
