//
//  EditSellerPriceList.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import Foundation
import BaseUI
import EsoftUIKit
import RxSwift
import YogaKit
import ThemeManager
import ListKit
import Localized


public final class EditSellerPriceList: ViewController<BaseListView> {
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
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    specializedView.collectionView.backgroundColor = ThemeManager.current().colors.screen
  }
}

extension EditSellerPriceList {
  enum Localized {
    public static let search = "search".localize()
  }
}
