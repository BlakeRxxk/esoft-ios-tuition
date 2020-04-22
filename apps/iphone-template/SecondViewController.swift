//
//  ViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import ThemeManager
import YogaKit

class SecondViewController: UIViewController {
  
  // MARK: - UI
  
  private(set) lazy var container: UIView = UIView()
//  private(set) lazy var previewItemView = PreviewItemView()
  private(set) lazy var addressItemViewYOGA: AddressItemViewYOGA = AddressItemViewYOGA()
  private(set) lazy var infoItemView: InfoItemViewYOGA = InfoItemViewYOGA()
  
  // MARK: - Life

  override func viewDidLoad() {
    super.viewDidLoad()

    createUI()
    configureUI()
    layout()
  }
  
  // MARK: - Functions
  
  private func createUI() {
    
    container.addSubview(addressItemViewYOGA)
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
//    previewItemView.address = Localized.address
//    previewItemView.currentPrice = Localized.currentPrice
//    previewItemView.price = Localized.price
//    previewItemView.photo = UIImage(named: "photo")
    
    // addressItemView
    addressItemViewYOGA.title = Localized.mainTitle
    
    // infoItemView
    infoItemView.firstTitle = Localized.views
    infoItemView.secondTitle = Localized.favorits
    infoItemView.thirdTitle = Localized.codeObject
  }
  
  private func layout() {
    
    container.configureLayout { layout in
      layout.paddingLeft = 16
      layout.paddingRight = 16
    }
    
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    container.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
      layout.width = YGValue(UIScreen.main.bounds.width)
      let topBarHeight = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? 0.0)
      layout.marginTop = YGValue(topBarHeight + 10)
    }
    
    infoItemView.configureLayout { layout in
      layout.isEnabled = true
    }
    
    addressItemViewYOGA.configureLayout { layout in
      layout.isEnabled = true
      layout.marginBottom = 4
      layout.width = 100%
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
}

private extension SecondViewController {
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
