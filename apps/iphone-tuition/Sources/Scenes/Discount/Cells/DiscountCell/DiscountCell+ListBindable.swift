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
    companyName.styledText = viewModel.partnerName

    layoutSubviews()
  }

  private func getDiscountType(mnemonic: String) -> String {
    if mnemonic == "constant" {
      return Localized.mainDiscount
    }
    return Localized.mainDiscount
  }
  
  public func bindViewModel(_ viewModel: Any, pressBackOnNavbar: @escaping (UIButton?) -> Void) {
    guard let viewModel = viewModel as? DiscountViewModel else { return }
    companyName.styledText = viewModel.partnerName
    let discountProgram = viewModel.programs[0]
    self.pressBackOnNavbar = pressBackOnNavbar

    button.setTitle(Localized.useDiscount, for: .normal)
    button.titleLabel?.setStyles(UILabel.Styles.headline)
    discountUseSpace.attributedText = NSAttributedString(string: viewModel.discountUseSpace, attributes: [.kern: -0.08])
    discountDescription.text = discountProgram.partnerDiscount + viewModel.additionalSaleParam
    discountType.text = getDiscountType(mnemonic: discountProgram.type)
    categoryLabel.attributedText = NSAttributedString(string: discountProgram.category,
                                                      attributes: [.kern: -0.08])
    companyName.text = viewModel.partnerName

    layoutSubviews()
  }
}

private extension DiscountCell {
  enum Localized {
    static let useDiscount = "Воспользоваться скидкой"
    static let mainDiscount = "Основная скидка"
  }
}
