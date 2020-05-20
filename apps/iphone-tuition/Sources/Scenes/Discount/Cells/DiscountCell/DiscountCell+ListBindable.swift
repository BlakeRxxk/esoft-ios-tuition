//
//  DiscountCell+ListBindable.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import IGListKit

extension DiscountCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? DiscountViewModel else { return }
    companyName.styledText = viewModel.companyName

    layoutSubviews()
  }
  
  public func bindViewModel(_ viewModel: Any, pressBackOnNavbar: @escaping (UIButton?) -> Void) {
    guard let viewModel = viewModel as? DiscountViewModel else { return }
    companyName.styledText = viewModel.companyName
    self.pressBackOnNavbar = pressBackOnNavbar

    button.setTitle(viewModel.useDiscount, for: .normal)
    button.titleLabel?.setStyles(UILabel.Styles.headline)
    whyYouCanUseDescription.attributedText = NSAttributedString(string: viewModel.whyYouCanUseDescription, attributes: [.kern: -0.08])
    discountDescription.text = viewModel.discountDescription
    discountType.text = viewModel.discountType
    categoryLabel.attributedText = NSAttributedString(string: viewModel.category, attributes: [.kern: -0.08])
    companyName.text = viewModel.companyName

    layoutSubviews()
  }
}
