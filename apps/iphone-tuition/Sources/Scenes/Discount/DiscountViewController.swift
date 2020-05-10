//
//  DiscountViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit
import AutoLayoutKit
import ThemeManager
import EsoftUIKit
import Atlas
import PINRemoteImage
import PINCache
import YogaKit

final class DiscountViewController: UIViewController {
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

  override var preferredStatusBarStyle: UIStatusBarStyle {
      .lightContent
  }

  internal lazy var layout: Layout = Layout()

  override func loadView() {
    view = UIView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    createUI()
    configureUI()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let containerSize = view.bounds.size
    view.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
    })

    imageContainer.configureLayout(block: layout.imageContainer)
    bodyContainer.configureLayout(block: layout.bodyContainer)
    imageViewWithGradient.configureLayout(block: layout.imageViewWithGradient)
    arrowBackImageView.configureLayout(block: layout.arrowBackImageView)
    favouritesImageView.configureLayout(block: layout.favouritesImageView)
    shareImageView.configureLayout(block: layout.shareImageView)
    companyName.configureLayout(block: layout.companyName)
    categoryLabel.configureLayout(block: layout.categoryLabel)
    discountType.configureLayout(block: layout.discountType)
    discountDescription.configureLayout(block: layout.discountDescription)
    divider.configureLayout(block: layout.divider)
    whyYouCanUseDescription.configureLayout(block: layout.whyYouCanUseDescription)
    button.configureLayout(block: layout.button)

    view.yoga.applyLayout(preservingOrigin: true)
    imageViewWithGradient.setImageGradient()
  }

  @objc func pressBackOnNavbar(sender: UITapGestureRecognizer) {
    self.navigationController?.popViewController(animated: true)
    self.navigationController?.isNavigationBarHidden = false
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
    self.navigationController?.isNavigationBarHidden = true

    bodyContainer.axis = .vertical
    bodyContainer.isLayoutMarginsRelativeArrangement = true
    bodyContainer.layoutMargins = UIEdgeInsets(top: Space.small, left: Space.small, bottom: Space.small, right: Space.small)
    bodyContainer.spacing = Space.small

    let pressBackOnNavbar = UITapGestureRecognizer(target: self, action: #selector(self.pressBackOnNavbar))
    arrowBackImageView.backgroundColor = UIColor.clear
    arrowBackImageView.contentMode = .center
    arrowBackImageView.image = UIImage.Arrow.Left.base
    arrowBackImageView.tintColor = UIColor.TextColor.white
    arrowBackImageView.isUserInteractionEnabled = true
    arrowBackImageView.addGestureRecognizer(pressBackOnNavbar)

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
