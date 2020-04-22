//
//  MortgageListViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import AutoLayoutKit

class MortgageListViewController: UIViewController {
  private(set) lazy var container: UIView = UIView()
  
  // header
  private(set) lazy var headerContainer: UIStackView = UIStackView()
  private(set) lazy var headerLabel: UILabel = UILabel()
  private(set) lazy var headerImage: UIImageView = UIImageView()
  
  // card
  private(set) lazy var mortgageInfoView: UIView = UIView()
  private(set) lazy var mortgageInfoContainer: UIStackView = UIStackView()
  
  // bank info
  private(set) lazy var bankRow: UIStackView = UIStackView()
  private(set) lazy var bankImage: UIImageView = UIImageView()
  private(set) lazy var bankInfoContainer: UIStackView = UIStackView()
  private(set) lazy var bankTitleLabel: UILabel = UILabel()
  private(set) lazy var bankDescriptionLabel: UILabel = UILabel()
   
  // container: rate with us
  private(set) lazy var rateWithUsRow: UIStackView = UIStackView()
  // left block
  private(set) lazy var rateWithUsContainer: UIStackView = UIStackView()
  private(set) lazy var rateWithUsTitleLabel: UILabel = UILabel()
  private(set) lazy var rateWithUsValueLabel: UILabel = UILabel()
  // right block
  private(set) lazy var paymentWithUsContainer: UIStackView = UIStackView()
  private(set) lazy var paymentWithUsTitleLabel: UILabel = UILabel()
  private(set) lazy var paymentWithUsValueLabel: UILabel = UILabel()
 
  private(set) lazy var divider: UIView = UIView()
  
  // container: rate with the bank
  private(set) lazy var bankRateRow: UIStackView = UIStackView()
  // left block
  private(set) lazy var bankRateContainer: UIStackView = UIStackView()
  private(set) lazy var bankRateTitleLabel: UILabel = UILabel()
  private(set) lazy var bankRateValueLabel: UILabel = UILabel()
  // right block
  private(set) lazy var bankPaymentContainer: UIStackView = UIStackView()
  private(set) lazy var bankPaymentTitleLabel: UILabel = UILabel()
  private(set) lazy var bankPaymentValueLabel: UILabel = UILabel()
  
  
  override func loadView() {
    view = UIView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    createUI()
    configureUI()
    layout()
  }

  private func createUI() {
    view.addSubview(container)

    // header
    headerContainer.addArrangedSubview(headerLabel)
    headerContainer.addArrangedSubview(headerImage)
    container.addSubview(headerContainer)

    // card
    container.addSubview(mortgageInfoView)
    mortgageInfoView.addSubview(mortgageInfoContainer)
    mortgageInfoContainer.addArrangedSubview(bankRow)

    // bank info
    bankRow.addArrangedSubview(bankImage)
    bankInfoContainer.addArrangedSubview(bankTitleLabel)
    bankInfoContainer.addArrangedSubview(bankDescriptionLabel)
    bankRow.addArrangedSubview(bankInfoContainer)
    
    // rate with us
    mortgageInfoContainer.addArrangedSubview(rateWithUsRow)
    rateWithUsRow.addArrangedSubview(rateWithUsContainer)
    rateWithUsContainer.addArrangedSubview(rateWithUsTitleLabel)
    rateWithUsContainer.addArrangedSubview(rateWithUsValueLabel)
    rateWithUsRow.addArrangedSubview(paymentWithUsContainer)
    paymentWithUsContainer.addArrangedSubview(paymentWithUsTitleLabel)
    paymentWithUsContainer.addArrangedSubview(paymentWithUsValueLabel)
    
    mortgageInfoContainer.addArrangedSubview(divider)
    
    // bank rate
    mortgageInfoContainer.addArrangedSubview(bankRateRow)
    bankRateRow.addArrangedSubview(bankRateContainer)
    bankRateContainer.addArrangedSubview(bankRateTitleLabel)
    bankRateContainer.addArrangedSubview(bankRateValueLabel)
    bankRateRow.addArrangedSubview(bankPaymentContainer)
    bankPaymentContainer.addArrangedSubview(bankPaymentTitleLabel)
    bankPaymentContainer.addArrangedSubview(bankPaymentValueLabel)
  }

  private func configureUI() {
    view.backgroundColor = AppTheme.current().colors.screen
    navigationItem.title = Localized.title
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: AppTheme.current().textColors.white]
    self.navigationController?.navigationBar.barTintColor = AppTheme.current().colors.defaultTopBar
    
    headerContainer.axis = .horizontal
    headerContainer.isLayoutMarginsRelativeArrangement = true
    headerContainer.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

    headerLabel.styledText = Localized.foundMortgages
    headerLabel.setStyles(
      UILabel.Styles.small,
      UILabel.Styles.secondary
    )
    headerImage.image = UIImage.Filter.base
    headerImage.tintColor = AppTheme.current().colors.icon

    mortgageInfoContainer.layoutMargins = UIEdgeInsets(top: Space.small, left: Space.small, bottom: Space.small, right: Space.small)
    mortgageInfoContainer.axis = .vertical
    mortgageInfoContainer.alignment = .fill

    mortgageInfoView.layer.backgroundColor = AppTheme.current().colors.container.cgColor

    bankRow.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: Space.tiny, right: 0)
    bankRow.axis = .horizontal
    bankImage.image = UIImage.Bank.Gazprombank.base

    bankInfoContainer.axis = .vertical
    bankInfoContainer.alignment = .center

    bankTitleLabel.styledText = Localized.bankTitle
    bankTitleLabel.setStyles(
      UILabel.Styles.headline
    )

    bankDescriptionLabel.styledText = Localized.bankDescription
    bankDescriptionLabel.lineBreakMode = .byTruncatingTail
    bankDescriptionLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.doubleLine,
      UILabel.Styles.secondary
    )
    
    divider.backgroundColor = AppTheme.current().colors.divider
    
    rateWithUsRow.layoutMargins = UIEdgeInsets(top: Space.tiny, left: Space.small, bottom: Space.tiny, right: Space.small)
    rateWithUsRow.axis = .horizontal
    rateWithUsRow.alignment = .center
    rateWithUsRow.distribution = .fillEqually
    rateWithUsContainer.axis = .vertical
    paymentWithUsContainer.axis = .vertical
    
    rateWithUsTitleLabel.styledText = Localized.rateWithUsTitile
    rateWithUsTitleLabel.setStyles(
      UILabel.Styles.uppercased,
      UILabel.Styles.tiny
    )
    rateWithUsTitleLabel.textColor = AppTheme.current().colors.primary500
    rateWithUsValueLabel.styledText = Localized.rateWithUsValue
    rateWithUsValueLabel.setStyles(
      UILabel.Styles.regular
    )
    
    paymentWithUsTitleLabel.styledText = Localized.paymentWithUsTitle
    paymentWithUsTitleLabel.setStyles(
      UILabel.Styles.uppercased,
      UILabel.Styles.tiny
    )
    paymentWithUsValueLabel.setStyles(
      UILabel.Styles.regular
    )
    paymentWithUsTitleLabel.textColor = AppTheme.current().colors.primary500
    paymentWithUsValueLabel.styledText = Localized.paymentWithUsValue
    
    bankRateRow.layoutMargins = UIEdgeInsets(top: Space.tiny, left: Space.small, bottom: Space.tiny, right: Space.small)
    bankRateRow.axis = .horizontal
    bankRateRow.alignment = .center
    bankRateRow.distribution = .fillEqually
    bankRateContainer.axis = .vertical
    bankPaymentContainer.axis = .vertical
    
    bankRateTitleLabel.styledText = Localized.bankRateTitle
    bankRateTitleLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.uppercased,
      UILabel.ColorStyle.placeholders
    )
    bankRateValueLabel.styledText = Localized.bankRateValue
    bankRateValueLabel.setStyles(
      UILabel.Styles.regular
    )
    
    bankPaymentTitleLabel.styledText = Localized.bankPaymentTitle
    bankPaymentTitleLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.uppercased,
      UILabel.ColorStyle.placeholders
    )
    bankPaymentValueLabel.styledText = Localized.bankPaymentValue
    bankPaymentValueLabel.setStyles(
      UILabel.Styles.regular
    )
  }

  private func layout() {
    [
      container,
      headerContainer,
      headerLabel,
      headerImage,
      mortgageInfoContainer,
      bankRow,
      mortgageInfoView,
      bankImage,
      bankInfoContainer,
      bankTitleLabel,
      bankDescriptionLabel,
      rateWithUsRow,
      rateWithUsContainer,
      rateWithUsTitleLabel,
      rateWithUsValueLabel,
      paymentWithUsContainer,
      paymentWithUsTitleLabel,
      paymentWithUsValueLabel,
      divider,
      bankRateRow,
      bankRateContainer,
      bankRateTitleLabel,
      bankRateValueLabel,
      bankPaymentContainer,
      bankPaymentTitleLabel,
      bankPaymentValueLabel
    ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    let constraints = [
      container.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
      container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      headerContainer.topAnchor.constraint(equalTo: container.topAnchor),
      headerContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      headerContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      headerContainer.bottomAnchor.constraint(equalTo: mortgageInfoView.topAnchor),
      headerContainer.heightAnchor.constraint(equalToConstant: 48.0),

      headerLabel.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 20.0),
      headerLabel.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: -Space.tiny),

      headerImage.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 18),
      headerImage.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: -6.0),
      headerImage.heightAnchor.constraint(equalToConstant: CGFloat(24.0)),
      headerImage.widthAnchor.constraint(equalToConstant: CGFloat(24.0)),

      mortgageInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mortgageInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mortgageInfoView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor),

      mortgageInfoContainer.leadingAnchor.constraint(equalTo: mortgageInfoView.leadingAnchor),
      mortgageInfoContainer.trailingAnchor.constraint(equalTo: mortgageInfoView.trailingAnchor),
      mortgageInfoContainer.topAnchor.constraint(equalTo: mortgageInfoView.topAnchor),
      mortgageInfoContainer.bottomAnchor.constraint(equalTo: mortgageInfoView.bottomAnchor),

      bankRow.leadingAnchor.constraint(equalTo: mortgageInfoContainer.layoutMarginsGuide.leadingAnchor),
      bankRow.trailingAnchor.constraint(equalTo: mortgageInfoContainer.layoutMarginsGuide.trailingAnchor),
      bankRow.topAnchor.constraint(equalTo: mortgageInfoContainer.layoutMarginsGuide.topAnchor),
      bankRow.bottomAnchor.constraint(equalTo: rateWithUsRow.topAnchor, constant: -Space.tiny),

      bankInfoContainer.topAnchor.constraint(equalTo: bankRow.layoutMarginsGuide.topAnchor),
      bankInfoContainer.bottomAnchor.constraint(equalTo: bankRow.layoutMarginsGuide.bottomAnchor),

      bankInfoContainer.leadingAnchor.constraint(equalTo: bankImage.trailingAnchor),
      bankInfoContainer.trailingAnchor.constraint(equalTo: bankRow.layoutMarginsGuide.trailingAnchor, constant: 12),

      bankImage.trailingAnchor.constraint(equalTo: bankInfoContainer.leadingAnchor, constant: -Space.tiny),
      bankImage.heightAnchor.constraint(equalToConstant: 64.0),
      bankImage.widthAnchor.constraint(equalToConstant: 64.0),

      bankTitleLabel.leadingAnchor.constraint(equalTo: bankInfoContainer.leadingAnchor),
      bankTitleLabel.trailingAnchor.constraint(equalTo: bankInfoContainer.layoutMarginsGuide.trailingAnchor),

      bankDescriptionLabel.leadingAnchor.constraint(equalTo: bankInfoContainer.leadingAnchor),
      bankDescriptionLabel.trailingAnchor.constraint(equalTo: bankInfoContainer.layoutMarginsGuide.trailingAnchor, constant: -Space.small),

      rateWithUsRow.leadingAnchor.constraint(equalTo: mortgageInfoContainer.layoutMarginsGuide.leadingAnchor),
      rateWithUsRow.trailingAnchor.constraint(equalTo: mortgageInfoContainer.layoutMarginsGuide.trailingAnchor),
      rateWithUsRow.layoutMarginsGuide.bottomAnchor.constraint(equalTo: divider.topAnchor),

      rateWithUsContainer.leadingAnchor.constraint(equalTo: rateWithUsRow.layoutMarginsGuide.leadingAnchor),
      rateWithUsContainer.topAnchor.constraint(equalTo: rateWithUsRow.layoutMarginsGuide.topAnchor),
      rateWithUsContainer.trailingAnchor.constraint(equalTo: paymentWithUsContainer.leadingAnchor),

      rateWithUsTitleLabel.bottomAnchor.constraint(equalTo: rateWithUsValueLabel.topAnchor, constant: -4),
      paymentWithUsTitleLabel.bottomAnchor.constraint(equalTo: paymentWithUsValueLabel.topAnchor, constant: -4),

      paymentWithUsContainer.trailingAnchor.constraint(equalTo: rateWithUsRow.layoutMarginsGuide.trailingAnchor),

      divider.heightAnchor.constraint(equalToConstant: 1.0),
      divider.leadingAnchor.constraint(equalTo: mortgageInfoContainer.leadingAnchor, constant: Space.small),
      divider.trailingAnchor.constraint(equalTo: mortgageInfoContainer.trailingAnchor, constant: -Space.small),

      bankRateRow.topAnchor.constraint(equalTo: divider.bottomAnchor),
      bankRateRow.leadingAnchor.constraint(equalTo: mortgageInfoContainer.layoutMarginsGuide.leadingAnchor),
      bankRateRow.trailingAnchor.constraint(equalTo: mortgageInfoContainer.layoutMarginsGuide.trailingAnchor),

      bankRateContainer.leadingAnchor.constraint(equalTo: bankRateRow.layoutMarginsGuide.leadingAnchor),
      bankRateContainer.topAnchor.constraint(equalTo: bankRateRow.layoutMarginsGuide.topAnchor),
      bankRateContainer.trailingAnchor.constraint(equalTo: bankPaymentContainer.leadingAnchor),

      bankPaymentContainer.trailingAnchor.constraint(equalTo: bankRateRow.layoutMarginsGuide.trailingAnchor),

      bankRateTitleLabel.bottomAnchor.constraint(equalTo: bankRateValueLabel.topAnchor, constant: -4),
      bankPaymentTitleLabel.bottomAnchor.constraint(equalTo: bankPaymentValueLabel.topAnchor, constant: -4),
    ]

    NSLayoutConstraint.activate(constraints)
  }
}

private extension MortgageListViewController {
  enum Localized {
    static let title = "Title"
    static let foundMortgages = "Найдено 13 ипотечных программ"
    static let bankTitle = "Газпромбанк"
    static let bankDescription = "Ипотека с государственной поддержкой для семей и детей с домашними животными"
    
    static let rateWithUsTitile = "Ставка с нами"
    static let rateWithUsValue = "12 %"
    static let paymentWithUsTitle = "Платеж с нами"
    static let paymentWithUsValue = "888 руб./мес"
    
    static let bankRateTitle = "Ставка с банком"
    static let bankRateValue = "17 %"
    static let bankPaymentTitle = "Платеж с банком"
    static let bankPaymentValue = "9 162 руб./мес."
  }
}
