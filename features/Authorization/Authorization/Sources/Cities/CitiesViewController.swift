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

final public class CitiesViewController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  
  let searchController = UISearchController(searchResultsController: nil)
  
  public init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  override public func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.modal)
    
    addLeftButtonIfNeeded(target: self, title: Localized.close, action: #selector(handleDismiss))
    navigationItem.title = Localized.city
    addInfoButtonIfNeeded(target: self, action: #selector(handleModal))
    
    setupSearchController(searchController: searchController, searchResultsUpdater: self)
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
    
    store?.action.onNext(.`init`)
  }
  
  private func configureUI() {
    view.setStyles(UIView.Styles.whiteBackground)
    
    specializedView.setStyles(UIView.Styles.defaultBackground)
  }
  
  @objc private func handleDismiss(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  @objc private func handleModal(sender: UIButton) {
    print("info")
  }
}

extension CitiesViewController: UISearchResultsUpdating {
  public func updateSearchResults(for searchController: UISearchController) {
    // Изменять State
    print(searchController.searchBar.text!)
  }
}

extension CitiesViewController {
  enum Localized {
    public static let city = "Город"
    public static let close = "Закрыть"
  }
}
