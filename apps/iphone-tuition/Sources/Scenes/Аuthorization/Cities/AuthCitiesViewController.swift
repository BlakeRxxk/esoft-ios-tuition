//
//  AuthCitiesViewController.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//


import UIKit
import BaseUI
import EsoftUIKit
import YogaKit
import RxSwift
import RxCocoa

final class AuthCitiesViewController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  
  let searchController = UISearchController(searchResultsController: nil)
  
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
      layout.width = 100%
      layout.height = 100%
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  private func configureUI() {
    view.setStyles(UIView.Styles.whiteBackground)
    
    specializedView.setStyles(UIView.Styles.defaultBackground)
  }
}
