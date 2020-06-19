//
//  String+LabelSize.swift
//  EsoftUIKit
//
//  Created by nedstar on 27.05.2020.
//

import UIKit
import Atlas

extension String {
  public func styledLabelHeight(with width: CGFloat, _ builder: (UILabel) -> Void) -> CGFloat {
    let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    builder(label)
    label.styledText = self
    label.sizeToFit()
    return round(label.frame.height)
  }
}
