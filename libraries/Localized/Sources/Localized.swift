//
//  Localized.swift
//  Localized
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension String {
  public func localize(tableName: String? = nil, bundle: Bundle = .main, comment: String = "") -> String {
    NSLocalizedString(
      self,
      tableName: tableName,
      bundle: bundle,
      value: "",
      comment: comment)
  }
}
