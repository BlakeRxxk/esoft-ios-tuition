//
//  SellerTicketViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import ThemeManager
import AutoLayoutKit
import YogaKit

final class SellerTicketViewController: UIViewController {
  
  // MARK: - Outlets
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var costItemViewYoga: CostItemViewYoga = CostItemViewYoga()
  private(set) lazy var photoItemViewYoga: PhotoItemViewYoga = PhotoItemViewYoga()
  
  // MARK: - View Controller
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    layout()
  }
  
  // MARK: - Methods
  private func createUI() {
    container.addSubview(costItemViewYoga)
    container.addSubview(photoItemViewYoga)
    
    view.addSubview(container)
  }
  
  private func configureUI() {
    photoItemViewYoga.dataSet = ["0", "2", "3", "4", "5", "6", "7", "7"]
    
    view.backgroundColor = AppTheme.current().colors.screen
    
    navigationItem.title = Localized.title

    costItemViewYoga.subheader = Localized.costSubheader
    costItemViewYoga.firstTitle = Localized.costLabel
    costItemViewYoga.secondTitle = Localized.noticeLabel
    costItemViewYoga.thirdTitle = Localized.editLabel
    
    photoItemViewYoga.subheader = Localized.photoSubheader
    photoItemViewYoga.firstTitle = Localized.showAllLabel
    photoItemViewYoga.secondTitle = Localized.showAllQuantityLabel
  }
  
  private func layout() {
    
    let yogaContainer = view.bounds.size
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(yogaContainer.width)
      layout.height = YGValue(yogaContainer.height)
    }
    
    container.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
      layout.width = 100%
    }

    costItemViewYoga.configureLayout { layout in
      layout.isEnabled = true
    }
    
    photoItemViewYoga.configureLayout { layout in
      layout.isEnabled = true
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
}

private extension SellerTicketViewController {
  enum Localized {
    static let title = "Title"
    static let costSubheader = "Стоимость объекта"
    static let costLabel = "700 500 000 руб."
    static let noticeLabel = "Выше рыночной на 90%"
    static let editLabel = "Изменить"
    static let photoSubheader = "Фотографии"
    static let showAllLabel = "Показать все"
    static let showAllQuantityLabel = "123"
  }
}
