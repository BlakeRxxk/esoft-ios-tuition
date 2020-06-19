//
//  SocialsCell+ListBindabel.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import EsoftUIKit
import IGListKit.IGListBindable

extension SocialsCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? SocialsViewModel else { return }
  
    socials = viewModel.socials

    layoutSubviews()
  }
}
