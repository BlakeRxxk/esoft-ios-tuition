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
import BaseUI
import IGListKit

final class DiscountViewController: ViewController<BaseListView> {
  var data: [DiscountViewModel] = [
    DiscountViewModel(id: 1,
                      companyName: "Hoff",
                      category: "Мебель, товары для дома",
                      discountType: "Основная скидка",
                      discountDescription: String(format: "15 000 руб. Скидка предоставляется в рамках программы \"Новое жилье с мебелью Hoff\". ",
                      "Акция не распротстраняется, и еще тут много очень текста, который скроется"),
                      whyYouCanUseDescription: "Вы совершили сделку с нашей компанией, теперь вам доступна скидка более высокого уровня, чем приветственная.",
                      useDiscount: "Воспользоваться скидкой")
  ]

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }

  init() {
    super.init(viewCreator: BaseListView.init)

    configureUI()
  }

  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func viewDidLayoutSubviews() {
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
    configureUI()
  }

  @objc func pressBackOnNavbar(sender: UIButton!) {
    self.navigationController?.popViewController(animated: true)
  }

  private func configureUI() {
    specializedView.adapter?.dataSource = self
//    specializedView.adapter?.scrollViewDelegate = self
    view.backgroundColor = ThemeManager.current().colors.container
  }
}

extension DiscountViewController: ListAdapterDataSource {
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    data as [ListDiffable]
  }

  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    DiscountSectionController(pressBackOnNavbar: pressBackOnNavbar)
  }

  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    nil
  }
}

//extension DiscountViewController: UIScrollViewDelegate {
//
//}
