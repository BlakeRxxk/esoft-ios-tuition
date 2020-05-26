//
//  123.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation
import BaseUI
import EsoftUIKit
import RxSwift
import RxCocoa
import YogaKit
import ThemeManager
import ListKit
import Localized

public final class AuthCitiesViewController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  
  let searchController = UISearchController(searchResultsController: nil)
  
  public init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  override public func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.modal)
    
    // вынести отсюда
    let item = UIBarButtonItem()
    item.style = .plain
    item.title = Localized.close
    item.target = self
    item.action = #selector(handleDismiss)
    navigationItem.leftBarButtonItem = item
    
    navigationItem.title = "Город" // Localized.city
    
    addInfoButtonIfNeeded(target: self, action: #selector(handleModal))
    
    // setupSearchController
//    searchController.searchResultsUpdater = self
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true // что это?
    if #available(iOS 11, *) {
        self.navigationItem.searchController = searchController
        self.navigationItem.searchController?.isActive = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
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
    
    bind()
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    
    specializedView.collectionView.backgroundColor = ThemeManager.current().colors.screen
  }
  
  private func bind() {
    // seatch
    
    // data
    let source = RxListAdapterDataSource<AuthCitiesSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .cities:
        return AuthCitiesSectionController()
      case .location:
        return LocationSectionController()
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    Observable.just([
      ListHeaderViewModel(count: 1, title: "Ваше местоположение"),
      LocationViewModel(id: 2, name: "123"),
      ListHeaderViewModel(count: 3, title: "Россия"),
      AuthCityViewModel(id: 4, name: "Москва", regions: ["Химки"], isComingSoon: false),
      AuthCityViewModel(id: 5, name: "Тюмень", regions: [], isComingSoon: false),
      ListHeaderViewModel(count: 6, title: "Германия"),
      AuthCityViewModel(id: 7, name: "Берлин", regions: ["Мюнхен", "Гамбург", "Кёльн", "Штуртгарт", "Лейпциг", "Бремен", "Ганновер"], isComingSoon: false),
      AuthCityViewModel(id: 8, name: "Дюссельдорф", regions: [], isComingSoon: true)
      ].mapToAuthCitiesSections())
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
  
  @objc private func handleDismiss(sender: UIButton) {
    // перевести на rx
    dismiss(animated: true, completion: nil)
  }
  
  @objc private func handleModal(sender: UIButton) {
    print("info")
  }
}

extension AuthCitiesViewController: UISearchResultsUpdating {
  public func updateSearchResults(for searchController: UISearchController) {
    print(searchController.searchBar.text!)
  }
}

extension AuthCitiesViewController {
  enum Localized {
    public static let search = "search".localize()
    public static let close = "Закрыть"
  }
}
