//
//  SpecialistDetailsActionCell+Output.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import EsoftUIKit

extension SpecialistDetailsActionCell: IconItemViewOutput {
  public func didTapAction(in view: IconItemViewInput) {
    output?.didTapAction(in: self)
  }
}
