//
//  ObjectsList.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 29.05.2020.
//

import Foundation
import BaseUI
import EsoftUIKit
import RxSwift
import YogaKit
import ThemeManager
import ListKit
import Localized

public final class ObjectsList: ViewController<BaseListView> {
  
  var switchControl: UISegmentedControl!
  
  public var disposeBag: DisposeBag = DisposeBag()

  public init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
    setupTopBar()
  }
  
  override public func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let container = view.bounds.size
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    specializedView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    specializedView.collectionView.backgroundColor = ThemeManager.current().colors.screen
    specializedView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
  }
  
  private func setupTopBar() {
    let items = ["Список", "Карта"]
    switchControl = UISegmentedControl(items: items)
    switchControl.selectedSegmentIndex = 0
    
    let font = UIFont.tiny
    switchControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    
    let textColor = [NSAttributedString.Key.foregroundColor: UIColor.white]
    switchControl.setTitleTextAttributes(textColor, for:.normal)
    
    let textColorSelected = [NSAttributedString.Key.foregroundColor: ThemeManager.current().colors.primary500]
    switchControl.setTitleTextAttributes(textColorSelected, for:.selected)
    
    navigationItem.titleView = switchControl
    navigationItem.rightBarButtonItem = .init(image: UIImage(named: "ic_subscriptions"), style: .plain, target: self, action: nil)
  }
  
  @objc private func refresh() {
    specializedView.reloadContent()
    specializedView.refreshControl.endRefreshing()
  }
  
}

extension ObjectsList {
  enum Localized {
    public static let search = "search".localize()
  }
}

