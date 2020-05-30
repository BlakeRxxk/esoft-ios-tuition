//
//  SellerTicketList.swift
//  AppLibrary
//
//  Created by wtildestar on 24/05/2020.
//

import Foundation
import BaseUI
import EsoftUIKit
import RxSwift
import YogaKit
import ThemeManager
import ListKit
import Localized


public final class SellerTicketList: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  
  public init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
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
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    store?.action.onNext(.refreshMySellerTicket)
    store?.action.onNext(.refreshMySellerTicket)
    store?.action.onNext(.refreshMySellerTicket)
    store?.action.onNext(.refreshMySellerTicket)
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    specializedView.collectionView.backgroundColor = ThemeManager.current().colors.screen
  }
}

extension SellerTicketList {
  enum Localized {
    public static let search = "search".localize()
  }
}
