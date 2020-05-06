//
//  ShimmeringView+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Atlas
import Foundation
import ShimmerUI

extension ShimmeringView {
  public enum Styles {
    public static let `default` = Style(name: "shimmer.default") { (item: ShimmeringView) in
      item.isShimmering = true
      item.shimmerPauseDuration = 2
    }
  }
}
