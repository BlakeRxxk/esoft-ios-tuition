//
//  ViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import ThemeManager
import AutoLayoutKit
import YogaKit

final class ViewController: UIViewController {
  
  // MARK: - Outlets
  private(set) lazy var costItemView: CostItemView = CostItemView()
  private(set) lazy var photoItemView: PhotoItemView = PhotoItemView()
  
  // MARK: - View Controller
  override func loadView() {
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    layout()
  }
  
  // MARK: - Methods
  private func createUI() {
    view.addSubview(costItemView)
    view.addSubview(photoItemView)
  }
  
  private func configureUI() {
    photoItemView.dataSet = ["0", "2", "3", "4", "5", "6", "7", "7"]
    
    view.backgroundColor = AppTheme.current().colors.screen
    
    navigationItem.title = Localized.title
    let nav = self.navigationController?.navigationBar
    nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    nav?.barTintColor = AppTheme.current().colors.defaultTopBar
    
    costItemView.subheader = Localized.costSubheader
    costItemView.firstTitle = Localized.costLabel
    costItemView.secondTitle = Localized.noticeLabel
    costItemView.thirdTitle = Localized.editLabel
    
    photoItemView.subheader = Localized.photoSubheader
    photoItemView.firstTitle = Localized.showAllLabel
    photoItemView.secondTitle = Localized.showAllQuantityLabel
  }
  
  private func layout() {
    [
      costItemView,
      photoItemView
      ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    
    let margins = view.layoutMarginsGuide
    
    // MARK: - Constraints
    let constraints = [
      costItemView.topAnchor.constraint(equalTo: margins.topAnchor),
      costItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      costItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      photoItemView.top.constraint(equalTo: costItemView.bottom),
      photoItemView.leading.constraint(equalTo: view.leading),
      photoItemView.trailing.constraint(equalTo: view.trailing)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
}

private extension ViewController {
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
