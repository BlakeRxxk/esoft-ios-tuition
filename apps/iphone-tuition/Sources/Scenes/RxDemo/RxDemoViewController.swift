//
//  RxDemoViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import YogaKit
import Network
import SpecialistsCore
import BaseUI
import EsoftUIKit
import ListKit
import IGListKit
import Localized

final class RxDemoViewController: ViewController<BaseListView> {
  private let disposeBag: DisposeBag = DisposeBag()
  private let networkAPI = CatalogsAPI(session: .init(.shared),
                                       baseUrl: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
  
  let objectSignal: BehaviorSubject<[SpecialistsSections]> = BehaviorSubject<[SpecialistsSections]>(value: [])
  
  init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
    bind()
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
    view.backgroundColor = AppTheme.current().colors.container
    specializedView.collectionView.backgroundColor = AppTheme.current().colors.screen
  }
}

extension RxDemoViewController {
  func bind() {
    let source = RxListAdapterDataSource<SpecialistsSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .empty:
        return EmptyListSectionController()
      case .listHeaderSkeleton:
        return ListHeaderSkeletonSectionController()
      case .skeleton:
        return SpecialistsListSkeletonSectionController()
      case .specialists:
        return SpecialistsSectionController(output: self)
      }
    })
    
    guard let adapter = specializedView.adapter else {
      return
    }
    
    objectSignal
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
//
//    let networkRequest = networkAPI
//      .getSpecialists(url: URL(string: "https://developers.etagi.com/api/v2/staff?&api_key=demo_lk_ios")!)
//      .share()
    
    objectSignal.onNext(showEmpty())
//    networkRequest
//      .elements()
//      .compactMap { $0.data }
//      .map { $0.map { $0.asViewModel() } }
//      .map { $0.mapToSpecialistsSections() }
//      .bind(to: adapter.rx.objects(for: source))
//      .disposed(by: disposeBag)
  }

  func showSkeleton() -> [SpecialistsSections] {
    return [
      ListHeaderSkeletonViewModel(id: 0),
      ListSkeletonViewModel(id: 1),
      ListSkeletonViewModel(id: 2),
      ListSkeletonViewModel(id: 3),
      ListSkeletonViewModel(id: 4),
      ListSkeletonViewModel(id: 5)
    ].mapToSpecialistsSections()
  }
  
  func showEmpty() -> [SpecialistsSections] {
    return [
      EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
      ].mapToSpecialistsSections()
  }
}

extension RxDemoViewController {
  enum Localized {
    public static let search = "search".localize()
  }
}

extension RxDemoViewController: SpecialistsSectionControllerOutput {
  func didTapPhone(in cell: SpecialistCellInput) {
    print("did tap phone")
  }
  
  func didTapChat(in cell: SpecialistCellInput) {
    print("did tap chat")
  }
  
  func didTapSpecialist(in cell: SpecialistCellInput) {
    print("did tap")
  }
}

enum SpecialistsSections {
  case header(ListHeaderViewModel)
  case empty(EmptyListViewModel)
  
  case listHeaderSkeleton(ListHeaderSkeletonViewModel)
  case skeleton(ListSkeletonViewModel)
  case specialists(SpecialistViewModel)
}

extension SpecialistsSections: SectionModelType {
  typealias ObjectType = ListDiffable
  
  var object: ListDiffable {
    switch self {
    case .header(let headerViewModel):
      return headerViewModel
    case let .empty(emptyListViewModel):
      return emptyListViewModel
    case let .listHeaderSkeleton(listHeaderSkeleton):
      return listHeaderSkeleton
    case let .skeleton(listSkeleton):
      return listSkeleton
    case let .specialists(specialistViewModel):
      return specialistViewModel
    }
  }
}

extension Array {
  func mapToSpecialistsSections() -> [SpecialistsSections] {
    return  map { obj -> SpecialistsSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is EmptyListViewModel:
        return .empty(obj as! EmptyListViewModel)
      case is ListSkeletonViewModel:
        return .skeleton(obj as! ListSkeletonViewModel)
      case is ListHeaderSkeletonViewModel:
        return .listHeaderSkeleton(obj as! ListHeaderSkeletonViewModel)
      case is SpecialistViewModel:
        return .specialists(obj as! SpecialistViewModel)
      default:
        return .empty(EmptyListViewModel(title: "", message: "", image: UIImage()))
      }
    }
  }
}


extension Specialist {
  public func asViewModel() -> SpecialistViewModel {
    let profileImage = ImageLinkBuilder(photoUrl ?? "").set(type: .profile).set(size: .crop100x100).build()
    return SpecialistViewModel(id: Int(id) ?? 0,
                               fio: fio,
                               lkId: lk?.id,
                               phone: phone,
                               email: email,
                               photoUrl: URL(string: profileImage),
                               position: position,
                               positionID: positionID,
                               managerID: managerID,
                               isMyManager: isMyManager ?? false)
  }
}
