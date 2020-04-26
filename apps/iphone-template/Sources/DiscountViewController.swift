//
//  DiscountViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import AutoLayoutKit
import ThemeManager
import EsoftUIKit
import Atlas
import PINRemoteImage
import PINCache

import Foundation
final class DiscountViewController: UIViewController {
  private lazy var navBarHeight: CGFloat = 56

  private(set) lazy var imageViewWithGradient: ImageViewWithGradient = ImageViewWithGradient()
  private(set) lazy var imageContainer: UIView = UIView()
  private(set) lazy var bodyContainer: UIStackView = UIStackView()

  private(set) lazy var arrowBackImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
  private(set) lazy var favouritesImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
  private(set) lazy var shareImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))

  private(set) lazy var companyName: UILabel = UILabel()
  private(set) lazy var categoryLabel: UILabel = UILabel()
  private(set) lazy var discountType: UILabel = UILabel()
  private(set) lazy var discountDescription: UILabel = UILabel()
  private(set) lazy var divider: UIView = UIView()
  private(set) lazy var whyYouCanUseDescription: UILabel = UILabel()
  private(set) lazy var button: UIButton = UIButton()

  override func loadView() {
    view = UIView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    createUI()
    configureUI()
    layout()
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
      .lightContent
  }

  private func createUI() {
    view.addSubview(imageContainer)
    view.addSubview(bodyContainer)
    imageContainer.addSubview(imageViewWithGradient)
    imageContainer.addSubview(arrowBackImageView)
    imageContainer.addSubview(favouritesImageView)
    imageContainer.addSubview(shareImageView)
    bodyContainer.addArrangedSubview(companyName)
    bodyContainer.addArrangedSubview(categoryLabel)
    bodyContainer.addArrangedSubview(discountType)
    bodyContainer.addArrangedSubview(discountDescription)
    bodyContainer.addArrangedSubview(divider)
    bodyContainer.addArrangedSubview(whyYouCanUseDescription)
    bodyContainer.addArrangedSubview(button)
  }

  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container

    bodyContainer.axis = .vertical
    bodyContainer.isLayoutMarginsRelativeArrangement = true
    bodyContainer.layoutMargins = UIEdgeInsets(top: Space.small, left: Space.small, bottom: Space.small, right: Space.small)
    bodyContainer.spacing = Space.small

    arrowBackImageView.backgroundColor = UIColor.clear
    arrowBackImageView.contentMode = .center
    arrowBackImageView.image = UIImage.Arrow.Left.base
    arrowBackImageView.tintColor = UIColor.TextColor.white

    favouritesImageView.backgroundColor = UIColor.clear
    favouritesImageView.contentMode = .center
    favouritesImageView.image = UIImage.Favourites.base
    favouritesImageView.tintColor = UIColor.TextColor.white

    shareImageView.backgroundColor = UIColor.clear
    shareImageView.contentMode = .center
    shareImageView.image = UIImage.Share.base
    shareImageView.tintColor = UIColor.TextColor.white

    companyName.text = Localized.companyName
    companyName.setStyles(UILabel.Styles.title3)

    categoryLabel.attributedText = NSAttributedString(string: Localized.category, attributes: [.kern: -0.08])
    categoryLabel.setStyles(UILabel.Styles.tiny)
    categoryLabel.textColor = UIColor.TextColor.placeholder

    discountType.text = Localized.discountType
    discountType.setStyles(UILabel.Styles.title3)

    discountDescription.text = Localized.discountDescription
    discountDescription.setStyles(UILabel.Styles.regular)
    discountDescription.numberOfLines = 3

    whyYouCanUseDescription.attributedText = NSAttributedString(string: Localized.whyYouCanUseDescription, attributes: [.kern: -0.08])
    whyYouCanUseDescription.setStyles(UILabel.Styles.tiny)
    whyYouCanUseDescription.textColor = UIColor.TextColor.placeholder
    whyYouCanUseDescription.numberOfLines = 0

    divider.backgroundColor = ThemeManager.current().colors.divider

    button.setTitle(Localized.useDiscount, for: .normal)
    button.backgroundColor = ThemeManager.current().colors.primary500
    button.layer.cornerRadius = 22
    button.titleLabel?.setStyles(UILabel.Styles.headline)

    imageViewWithGradient.imageView.pin_setImage(from: URL(string: "https://www.alpinabook.ru/upload/setka-editor/adf/adf5e93695c6631c3d9d1f6cc17db8ba.jpg"))
    imageViewWithGradient.locations = (0, 0.5)
  }

  private func layout() {
    [
      imageContainer,
      bodyContainer,
      arrowBackImageView,
      favouritesImageView,
      shareImageView,
      companyName,
      categoryLabel,
      discountType,
      discountDescription,
      divider,
      whyYouCanUseDescription,
      button,
      imageViewWithGradient
    ].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let constraints = [
      imageViewWithGradient.topAnchor.constraint(equalTo: view.topAnchor),
      imageViewWithGradient.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageViewWithGradient.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      arrowBackImageView.topAnchor.constraint(equalTo: imageViewWithGradient.topAnchor, constant: navBarHeight),
      arrowBackImageView.leadingAnchor.constraint(equalTo: imageViewWithGradient.leadingAnchor, constant: 14.0),

      favouritesImageView.topAnchor.constraint(equalTo: imageViewWithGradient.topAnchor, constant: navBarHeight),
      favouritesImageView.trailingAnchor.constraint(equalTo: shareImageView.leadingAnchor, constant: -10.5),

      shareImageView.topAnchor.constraint(equalTo: imageViewWithGradient.topAnchor, constant: navBarHeight + 3.0),
      shareImageView.trailingAnchor.constraint(equalTo: imageViewWithGradient.trailingAnchor, constant: -18.0),

      bodyContainer.topAnchor.constraint(equalTo: imageViewWithGradient.bottomAnchor, constant: 12.0),
      bodyContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bodyContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      companyName.topAnchor.constraint(equalTo: bodyContainer.topAnchor),

      categoryLabel.topAnchor.constraint(equalTo: companyName.bottomAnchor, constant: 2.0),

      discountType.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: Space.base),

      discountDescription.topAnchor.constraint(equalTo: discountType.bottomAnchor, constant: Space.tiny),

      divider.heightAnchor.constraint(equalToConstant: 1.0),

      whyYouCanUseDescription.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: Space.tiny),

      button.heightAnchor.constraint(equalToConstant: Space.large)
    ]

    NSLayoutConstraint.activate(constraints)
  }
}

private extension DiscountViewController {
  enum Localized {
    static let companyName = "Hoff"
    static let category = "Мебель, товары для дома"
    static let discountType = "Основная скидка"
    static let discountDescription = "15 000 руб. Скидка предоставляется в рамках программы \"Новое жилье с мебелью Hoff\"."
    + " Акция не распротстраняется, и еще тут много очень текста, который скроется"
    static let whyYouCanUseDescription = "Вы совершили сделку с нашей компанией, теперь вам доступна скидка более высокого уровня, чем приветственная."
    static let useDiscount = "Воспользоваться скидкой"
  }
}
