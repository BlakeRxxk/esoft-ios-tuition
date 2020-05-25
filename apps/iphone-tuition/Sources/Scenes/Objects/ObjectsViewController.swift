//
//  ObjectsViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import ThemeManager
import YogaKit
import NetworkTrainee
import IGListKit
import BaseUI

final class ObjectsViewController: ViewController<BaseListView> {
  
  var networkManager = NetworkManager()
  private var data: [ObjectViewModel] = []
  
  // MARK: - Init
  
  init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  // MARK: - Life
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    networkManager.getObjects { [weak self] (res, _) in
      guard
        let self = self,
        let objects = res else { return }
        
      let tmp = objects.map { ObjectViewModel(id: $0.id,
                                              price: $0.price,
                                              oldPrice: $0.oldPrice ?? "",
                                              city: $0.city,
                                              district: $0.district,
                                              street: $0.street,
                                              house: $0.house,
                                              type: $0.type,
                                              roomsCount: $0.roomsCount,
                                              areaFlat: $0.areaFlat,
                                              floorsNum: $0.floorsNum,
                                              floorsCnt: $0.floorsCnt,
                                              priceAr: $0.priceAr,
                                              photos: $0.photos,
                                              viewsCount: $0.viewsCount ?? "",
                                              isFavorite: $0.isFavorite ?? "")
      }
      self.data.append(contentsOf: tmp)
      
      DispatchQueue.main.async {
        self.specializedView.adapter?.performUpdates(animated: true)
      }
    }
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
    
//    layout()
  }
  
  // MARK: - Functions
  
  private func configureUI() {
    specializedView.adapter?.dataSource = self
    specializedView.adapter?.scrollViewDelegate = self
  }
  
}

//private extension ObjectsViewController {
//  enum Localized {
//    static let price = "2 300 000 руб."
//    static let currentPrice = "2 200 000 руб."
//    static let address = "Тюмень, Центр: КПД, Республики"
//    static let mainTitle = "Пансионат, 1-комн., 18 м², этаж 3/8, 69 444 руб./м²"
//    static let views = "314"
//    static let favorits = "7,4"
//    static let codeObject = "Код объекта: 773355"
//  }
//}

extension ObjectsViewController: ListAdapterDataSource {
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    data as [ListDiffable]
  }
  
  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    ObjectsSectionController()
  }
  
  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    nil
  }
}

extension ObjectsViewController: UIScrollViewDelegate {
  public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                        withVelocity velocity: CGPoint,
                                        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
    
    if distance < 300 {
      // put your updating code here
    }
  }
}
