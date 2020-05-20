//
//  DiscountCell.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import YogaKit
import ThemeManager
import EsoftUIKit
import PINRemoteImage
import PINCache

public final class DiscountCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "DiscountCellID"

  private(set) lazy var imageViewWithGradient: ImageViewWithGradient = ImageViewWithGradient()
  private(set) lazy var imageContainer: UIView = UIView()
  private(set) lazy var bodyContainer: UIView = UIView()

  private(set) lazy var arrowBackButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
  private(set) lazy var favouritesImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
  private(set) lazy var shareImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))

  private(set) lazy var companyName: UILabel = UILabel()
  private(set) lazy var categoryLabel: UILabel = UILabel()
  private(set) lazy var discountType: UILabel = UILabel()
  private(set) lazy var discountDescription: UILabel = UILabel()
  private(set) lazy var divider: UIView = UIView()
  private(set) lazy var whyYouCanUseDescription: UILabel = UILabel()
  private(set) lazy var button: UIButton = UIButton()
  public lazy var pressBackOnNavbar: (UIButton?) -> Void = {_ in }

  override init(frame: CGRect = .zero) {
    super.init(frame: frame)

    createUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func prepareForReuse() {
    super.prepareForReuse()
  }

  @objc func buttonAction(_ sender: UIButton!) {
    pressBackOnNavbar(sender)
  }

  private func createUI() {
    contentView.addSubview(imageContainer)
    contentView.addSubview(bodyContainer)
    imageContainer.addSubview(imageViewWithGradient)
    imageContainer.addSubview(arrowBackButton)
    imageContainer.addSubview(favouritesImageView)
    imageContainer.addSubview(shareImageView)
    bodyContainer.addSubview(companyName)
    bodyContainer.addSubview(categoryLabel)
    bodyContainer.addSubview(discountType)
    bodyContainer.addSubview(discountDescription)
    bodyContainer.addSubview(divider)
    bodyContainer.addSubview(whyYouCanUseDescription)
    bodyContainer.addSubview(button)
  }

  private func configureUI() {
    arrowBackButton.backgroundColor = UIColor.clear
    arrowBackButton.setImage(UIImage.Arrow.Left.base, for: .normal)
    arrowBackButton.tintColor = UIColor.TextColor.white
    arrowBackButton.addTarget(self, action: #selector(self.buttonAction(_:)), for: .touchUpInside)

    favouritesImageView.backgroundColor = UIColor.clear
    favouritesImageView.contentMode = .center
    favouritesImageView.image = UIImage.Favourites.base
    favouritesImageView.tintColor = UIColor.TextColor.white

    shareImageView.backgroundColor = UIColor.clear
    shareImageView.contentMode = .center
    shareImageView.image = UIImage.Share.base
    shareImageView.tintColor = UIColor.TextColor.white

    companyName.setStyles(UILabel.Styles.title3)

    categoryLabel.setStyles(UILabel.Styles.tiny)
    categoryLabel.textColor = UIColor.TextColor.placeholder

    discountType.setStyles(UILabel.Styles.title3)

    discountDescription.setStyles(UILabel.Styles.regular)
    discountDescription.numberOfLines = 3

    whyYouCanUseDescription.setStyles(UILabel.Styles.tiny)
    whyYouCanUseDescription.textColor = UIColor.TextColor.placeholder
    whyYouCanUseDescription.numberOfLines = 0

    divider.backgroundColor = ThemeManager.current().colors.divider

    button.backgroundColor = ThemeManager.current().colors.primary500
    button.layer.cornerRadius = 22

    imageViewWithGradient.imageView.pin_setImage(from: URL(string: "https://www.alpinabook.ru/upload/setka-editor/adf/adf5e93695c6631c3d9d1f6cc17db8ba.jpg"))
    imageViewWithGradient.setImageGradient()
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    configureUI()

    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
    }

    imageContainer.configureLayout(block: Layout.imageContainer)
    bodyContainer.configureLayout(block: Layout.bodyContainer)
    imageViewWithGradient.configureLayout(block: Layout.imageViewWithGradient)
    arrowBackButton.configureLayout(block: Layout.arrowBackButton)
    favouritesImageView.configureLayout(block: Layout.favouritesImageView)
    shareImageView.configureLayout(block: Layout.shareImageView)
    companyName.configureLayout(block: Layout.companyName)
    categoryLabel.configureLayout(block: Layout.categoryLabel)
    discountType.configureLayout(block: Layout.discountType)
    discountDescription.configureLayout(block: Layout.discountDescription)
    divider.configureLayout(block: Layout.divider)
    whyYouCanUseDescription.configureLayout(block: Layout.whyYouCanUseDescription)
    button.configureLayout(block: Layout.button)

    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

//private extension DiscountCell {
//  enum Localized {
//    static let companyName = "Hoff"
//    static let category = "Мебель, товары для дома"
//    static let discountType = "Основная скидка"
//    static let discountDescription = "15 000 руб. Скидка предоставляется в рамках программы \"Новое жилье с мебелью Hoff\"."
//    + " Акция не распротстраняется, и еще тут много очень текста, который скроется"
//    static let whyYouCanUseDescription = "Вы совершили сделку с нашей компанией, теперь вам доступна скидка более высокого уровня, чем приветственная."
//    static let useDiscount = "Воспользоваться скидкой"
//  }
//}
