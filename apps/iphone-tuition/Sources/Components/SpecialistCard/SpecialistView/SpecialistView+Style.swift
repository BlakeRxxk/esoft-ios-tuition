//
//  SpecialistView+Style.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import Atlas

extension SpecialistView {
  public enum Styles {
    public static let `default` = Style(name: "specialist.item.view.default") { (item: SpecialistView) in
      item.rightButtonMode = .default
    }
    
    public static let withAction = Style(name: "specialist.item.view.with.action") { (item: SpecialistView) in
      item.rightButtonMode = .visible
    }
  }
}
