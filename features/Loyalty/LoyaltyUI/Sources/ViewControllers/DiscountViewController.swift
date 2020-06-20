//
//  Discount.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import BaseUI
import EsoftUIKit
import RxSwift
import YogaKit
import ThemeManager
import ListKit
import Localized
import IGListKit

public final class DiscountViewController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  public weak var detailsTransitioningDelegate: InteractiveModalTransitioningDelegate?
  
  public init() {
    func viewCreator() -> BaseListView {
      BaseListView.init(deleteRefreshControl: true)
    }
    super.init(viewCreator: viewCreator)

    configureUI()
  }

  public override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    automaticallyAdjustsScrollViewInsets = false
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
    specializedView.adapter?.scrollViewDelegate = self
    specializedView.collectionView.backgroundColor = ThemeManager.current().colors.screen
//    collectionView.refreshControl = nil
  }

  @objc func pressBackOnNavbar(sender: UIButton!) {
    self.navigationController?.popViewController(animated: true)
  }

  deinit {
    detailsTransitioningDelegate = nil
  }
}

extension DiscountViewController {
  enum Localized {
    // public static let search = "search".localize()
    // public static let title = "Все специалисты"
  }
}

extension DiscountViewController: UIScrollViewDelegate {
  public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                        withVelocity velocity: CGPoint,
                                        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    // let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)

    // guard let currentState = store?.currentState else {
    //   return
    // }

    // let page = currentState.page
    // let pages = currentState.pages

    // if distance < 100, page < pages {
    //   store?.action.onNext(.fetchSpecialists(page: page + 1))
    // }
  }
}
