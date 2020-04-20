//
//  ViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import ThemeManager

class ViewController: UIViewController {
  
  // MARK: - UI
  
  private(set) lazy var container: UIView = {
    let view = UIView()
    view.backgroundColor = AppTheme.current().colors.container
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // topView
  
  private(set) lazy var topView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var topViewStack: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var currentPrice: UILabel = {
    let label = UILabel()
    label.text = Localized.currentPrice
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var priceStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  private(set) lazy var priceImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage.arrowDown
    imageView.tintColor = AppTheme.current().colors.primary500
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private(set) lazy var price: UILabel = {
    let label = UILabel()
    label.text = Localized.price
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var address: UILabel = {
    let label = UILabel()
    label.text = Localized.address
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // mainView
  
  private(set) lazy var mainView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var image: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "photo")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private(set) lazy var favoriteButton: UIButton = {
    let btn = UIButton()
    btn.setBackgroundImage(UIImage.favorit, for: .normal)
    btn.tintColor = .white
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  // bottomView
  
  private(set) lazy var bottomView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var titleStack: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var mainTitle: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.text = Localized.mainTitle
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var phoneButton: UIButton = {
    let btn = UIButton()
    btn.setBackgroundImage(UIImage.Call.right, for: .normal)
    btn.tintColor = AppTheme.current().colors.primary500
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  // INFO STACK
  private(set) lazy var infoStack: InfoItemView = {
    let info = InfoItemView()
    info.firstTitle = Localized.views
    info.secondTitle = Localized.favorits
    info.thirdTitle = Localized.codeObject
    info.translatesAutoresizingMaskIntoConstraints = false
    return info
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = AppTheme.current().colors.container
    
    setupScreen()
    addSubviewInView()
    configureUI()
  }
  
  // MARK: - Functions
  
  private func setupScreen() {
    
    // view
    view.backgroundColor = AppTheme.current().colors.screen
    
    // navigation
    navigationItem.title = "Title"
    
    // imageView
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    
    // setupUI
    currentPrice.setStyles(
      UILabel.Styles.title3
    )
    
    price.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.strikeThrough,
      UILabel.ColorStyle.placeholders
    )
    
    address.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.secondary
    )
    
    mainTitle.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.primary
    )
    
  }
  
  private func addSubviewInView() {
    view.addSubview(container)
    
    container.addSubview(topView)
    topView.addSubview(topViewStack)
    topViewStack.addArrangedSubview(currentPrice)
    topViewStack.addArrangedSubview(priceStack)
    priceStack.addArrangedSubview(priceImage)
    priceStack.addArrangedSubview(price)
    topView.addSubview(address)
    
    container.addSubview(mainView)
    mainView.addSubview(image)
    mainView.addSubview(favoriteButton)
    
    container.addSubview(bottomView)
    bottomView.addSubview(titleStack)
    titleStack.addArrangedSubview(mainTitle)
    titleStack.addArrangedSubview(phoneButton)
    
    bottomView.addSubview(infoStack)
  }
  
  private func configureUI() {
    
    // setup
    priceStack.alignment = .center
    priceStack.spacing = 3
    
    titleStack.spacing = 60
    titleStack.alignment = .center
    
    let margins = view.layoutMarginsGuide
    
    // topView
    
    container.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
    container.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    container.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    topView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
    
    topViewStack.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12).isActive = true
    topViewStack.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16).isActive = true
    topViewStack.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16).isActive = true
    
    priceImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
    priceImage.heightAnchor.constraint(equalToConstant: 10.5).isActive = true
    
    address.topAnchor.constraint(equalTo: topViewStack.bottomAnchor, constant: 2).isActive = true
    address.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16).isActive = true
    address.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16).isActive = true
    address.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8).isActive = true
    
    // mainView
    
    mainView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    image.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    image.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16).isActive = true
    image.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
    image.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    image.heightAnchor.constraint(equalToConstant: 207).isActive = true
    
    favoriteButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 13).isActive = true
    favoriteButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -28.5).isActive = true
    favoriteButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
    favoriteButton.widthAnchor.constraint(equalToConstant: 21.95).isActive = true
    
    // bottomView
    
    bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    bottomView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
    
    titleStack.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 8).isActive = true
    titleStack.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16).isActive = true
    titleStack.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16).isActive = true
    
    mainTitle.bottomAnchor.constraint(lessThanOrEqualTo: titleStack.bottomAnchor, constant: -4).isActive = true
    
    phoneButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
    phoneButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    infoStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 4).isActive = true
    infoStack.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16).isActive = true
    infoStack.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16).isActive = true
    infoStack.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -8).isActive = true
  }
  
}

private extension ViewController {
  enum Localized {
    static let price = "2 300 000 руб."
    static let currentPrice = "2 200 000 руб."
    static let address = "Тюмень, Центр: КПД, Республики"
    static let mainTitle = "Пансионат, 1-комн., 18 м², этаж 3/8, 69 444 руб./м²"
    static let views = "314"
    static let favorits = "7,4"
    static let codeObject = "Код объекта: 773355"
  }
}
