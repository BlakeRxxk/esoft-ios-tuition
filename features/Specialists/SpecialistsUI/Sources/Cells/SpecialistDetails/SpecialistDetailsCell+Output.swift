//
//  SpecialistDetailsCell+Output.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import EsoftUIKit

extension SpecialistDetailsCell: IconItemViewOutput {
  enum SpecialistDetailsCellRow: String {
    case phone = "phoneRow"
    case email = "emailRow"
  }
  
  public func didTapAction(in view: IconItemViewInput) {
    let row = SpecialistDetailsCellRow.init(rawValue: view.viewID)
    switch row {
    case .phone:
      didTapCallRow()
    case .email:
      didTapEmailAction()
    case .none: break
    }
  }
  
  private func didTapCallRow() {
    output?.didTapPhone(in: self)
  }
  
  private func didTapEmailAction() {
    output?.didTapEmail(in: self)
  }
  
  func formatPhoneNumber(number: String) -> String {
    let currentLocale = Locale.current.regionCode ?? "RU"
    
    return number
  }
}
