//
//  SpecialistsList+Sections.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import Foundation

extension SpecialistsList: SpecialistsSectionControllerOutput {
  public func didTapSpecialist(in cell: SpecialistCellInput) {
    router?.routeToSpecialistsDetails(specialistID: cell.specialistID)
  }
  
  public func didTapPhone(in cell: SpecialistCellInput) {
    
    guard let url = URL(string: "tel://\(cell.phoneNumber)") else { return }
    guard UIApplication.shared.canOpenURL(url) else { return }

    UIApplication.shared.open(url)
  }
  
  public func didTapChat(in cell: SpecialistCellInput) {
    let alert = UIAlertController(title: "", message: "not available", preferredStyle: .alert)
    let action = UIAlertAction(title: "ok", style: .default) { [unowned self] _ in
      self.setNeedsStatusBarAppearanceUpdate()
    }
    alert.setStyles(UIAlertController.Styles.default)
    
    alert.addAction(action)
    
    present(alert, animated: true)
  }
}
