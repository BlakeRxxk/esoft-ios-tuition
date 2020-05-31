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
import NetworkTrainee

final class DiscountViewController: ViewController<BaseListView> {
  var networkManager = NetworkManager()
  var data: [DiscountViewModel] = []

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }

  init() {
    super.init(viewCreator: BaseListView.init)
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
    automaticallyAdjustsScrollViewInsets = false
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

  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    networkManager.getLoyalty(page: 1) { [unowned self] (res, _) in
      guard let loyalty = res else { return }
      guard let loyaltyProgram = res?.programs[0] else { return }
      let tmp = DiscountViewModel(id: loyalty.id,
                                               additionalSaleParam: loyalty.additionalSaleParam,
                                               address: loyalty.address,
                                               categoryId: loyalty.categoryId,
                                               cityId: loyalty.cityId,
                                               aboutCompany: loyalty.aboutCompany,
                                               partnerName: loyalty.partnerName,
                                               coordinates: loyalty.coordinates,
                                               dateCreated: loyalty.dateCreated,
                                               dateUpdated: loyalty.dateUpdated,
                                               isFavorite: loyalty.isFavorite,
                                               level: loyalty.level,
                                               logo: loyalty.logo,
                                               order: loyalty.order,
                                               firstPhone: loyalty.firstPhone,
                                               secondPhone: loyalty.secondPhone,
                                               site: loyalty.site,
                                               visible: loyalty.visible,
                                               discountUseSpace: loyaltyProgram.discountUseSpace,
                                               programs: loyalty.programs)
      self.data.append(tmp)
      DispatchQueue.main.async {
        self.specializedView.adapter?.performUpdates(animated: true)
      }
    }
  }

  @objc func pressBackOnNavbar(sender: UIButton!) {
    self.navigationController?.popViewController(animated: true)
  }

  private func configureUI() {
    specializedView.adapter?.dataSource = self
    specializedView.adapter?.scrollViewDelegate = self
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

extension DiscountViewController: UIScrollViewDelegate {

}
