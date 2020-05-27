//
//  String+LabelSize.swift
//  EsoftUIKit
//
//  Created by nedstar on 27.05.2020.
//

import UIKit
import Atlas

extension String {
  public func styledLabelHeight(with width: CGFloat, _ styles: Atlas.Style...) -> CGFloat {
    let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
//    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.setStyles(styles)
    label.styledText = self
    label.sizeToFit()
    return round(label.frame.height)
  }
}
