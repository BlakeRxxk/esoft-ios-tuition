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
  
  private(set) lazy var container = UIView()
  private(set) lazy var previewItemView = PreviewItemView()
  private(set) lazy var addressItemView = AddressItemView()
  private(set) lazy var infoItemView = InfoItemView()
  
  private var activeConstraints: [NSLayoutConstraint] = []
  
  // MARK: - Life

  override func viewDidLoad() {
    super.viewDidLoad()

    createUI()
    configureUI()
    layout()
  }
  
  // MARK: - Functions
  
  private func createUI() {
    let subviews: [UIView] = [
      container,
      previewItemView,
      addressItemView,
      infoItemView
    ]
    
    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
 
    container.addSubview(previewItemView)
    container.addSubview(addressItemView)
    container.addSubview(infoItemView)
    
    view.addSubview(container)
  }
  
  private func configureUI() {
    // view
    view.backgroundColor = AppTheme.current().colors.screen
    
    // navigation
    navigationItem.title = "Title"
    
    // container
    container.backgroundColor = AppTheme.current().colors.container
    
    // previewItemView
    previewItemView.address = Localized.address
    previewItemView.currentPrice = Localized.currentPrice
    previewItemView.price = Localized.price
    previewItemView.photo = UIImage(named: "photo")
    
    // addressItemView
    addressItemView.title = Localized.mainTitle
    
    // infoItemView
    infoItemView.firstTitle = Localized.views
    infoItemView.secondTitle = Localized.favorits
    infoItemView.thirdTitle = Localized.codeObject
  }
  
  private func layout() {
    let margins = view.layoutMarginsGuide
    activeConstraints = [
      container.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
      container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      previewItemView.topAnchor.constraint(equalTo: container.topAnchor),
      previewItemView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      previewItemView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      
      addressItemView.topAnchor.constraint(equalTo: previewItemView.bottomAnchor, constant: 8),
      addressItemView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
      addressItemView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
      
      infoItemView.topAnchor.constraint(equalTo: addressItemView.bottomAnchor, constant: 4),
      infoItemView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
      infoItemView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
      infoItemView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8)
    ]
    NSLayoutConstraint.activate(activeConstraints)
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
