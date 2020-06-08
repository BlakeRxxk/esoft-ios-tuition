//
//  SellerTicketViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import YogaKit
import NetworkTrainee
import IGListKit
import BaseUI

final class SellerTicketViewController: ViewController<BaseListView> {
  
  // MARK: - Outlets
  private(set) lazy var costItemViewYoga: CostItemViewYoga = CostItemViewYoga()
  private(set) lazy var photoItemViewYoga: PhotoItemViewYoga = PhotoItemViewYoga()
  
  // MARK: - Variable
  var networkManager = NetworkManager()
  private var data: [SellerTicketViewModel] = []
  
  init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  // MARK: - View Controller
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    createUI()
//  }
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    networkManager.getSellerTicket(page: 1) { [unowned self] (res, _) in
      guard let sellerTicket = res else { return }
      
      print(sellerTicket)
      let tmp = SellerTicketViewModel(id: sellerTicket.id, price: sellerTicket.price, photos: sellerTicket.photos)
      self.data.append(tmp)
      
      DispatchQueue.main.async {
        self.specializedView.adapter?.performUpdates(animated: true)
      }
    }
    
//    networkManager.getPhotos { (res, _) in
//
//    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    layout()
  }
  
  // MARK: - Methods
//  private func createUI() {
//    view.addSubview(costItemViewYoga)
//    view.addSubview(photoItemViewYoga)
//  }
  
  private func configureUI() {
    specializedView.adapter?.dataSource = self
//    specializedView.adapter?.scrollViewDelegate = self
//
//    photoItemViewYoga.dataSet = ["0", "2", "3", "4", "5", "6", "7", "7"]
//
    
//    navigationItem.title = Localized.title
//
//    costItemViewYoga.subheader = Localized.costSubheader
//    costItemViewYoga.firstTitle = Localized.costLabel
//    costItemViewYoga.secondTitle = Localized.noticeLabel
//    costItemViewYoga.thirdTitle = Localized.editLabel
//
//    photoItemViewYoga.subheader = Localized.photoSubheader
//    photoItemViewYoga.firstTitle = Localized.showAllLabel
//    photoItemViewYoga.secondTitle = Localized.showAllQuantityLabel
  }
  
  private func layout() {
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
    
//    view.configureLayout { layout in
//      layout.isEnabled = true
//      layout.flexDirection = .column
//      layout.width = 100%
//      layout.height = 100%
//    }
    
//    costItemViewYoga.configureLayout { layout in
//      layout.isEnabled = true
//      layout.width = 100%
//    }
//
//    photoItemViewYoga.configureLayout { layout in
//      layout.isEnabled = true
//      layout.width = 100%
//    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
}

extension SellerTicketViewController: ListAdapterDataSource {
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    data as [ListDiffable]
  }
  
  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    SellerTicketSectionController()
  }
  
  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    nil
  }
}

//extension SellerTicketViewController: UIScrollViewDelegate {
//  public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
//                                        withVelocity velocity: CGPoint,
//                                        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
//
//    if distance < 300 {
//      // put your updating code here
//    }
//  }
//}

//private extension SellerTicketViewController {
//  enum Localized {
//    static let title = "Title"
//    static let costSubheader = "Стоимость объекта"
//    static let costLabel = "700 500 000 руб."
//    static let noticeLabel = "Выше рыночной на 90%"
//    static let editLabel = "Изменить"
//    static let photoSubheader = "Фотографии"
//    static let showAllLabel = "Показать все"
//    static let showAllQuantityLabel = "123"
//  }
//}
