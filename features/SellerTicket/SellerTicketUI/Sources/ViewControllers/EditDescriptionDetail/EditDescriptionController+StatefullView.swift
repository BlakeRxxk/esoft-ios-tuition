//
//  EditDescriptionController+StatefullView.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import EsoftUIKit
import RxSwift
import ListKit
import SellerTicketImplementation
import StateKit
import IGListDiffKit.IGListDiffable
import RxExtensions

extension EditDescriptionController: StatefullView {
  public func bind(store: EditDescriptionControllerState) {
    let state = store.state.distinctUntilChanged().share().debug()
    
    let source = RxListAdapterDataSource<EditDescriptionSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .empty:
        return EmptyListSectionController()
      case .editDescription:
        return EditDescriptionSectionController()
      }
    })
    
    rx
      .viewWillAppear
      .map { _ in EditDescriptionControllerState.Action.fetchDesc }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    let empty = state
      .filter { $0.initialLoading == false && $0.desc == nil }
      .map { _ in [
        EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
        ]}
      .map { $0.mapToEditDescriptionSections() }
    
    let editDescription = state
      .filter { $0.initialLoading == false && $0.desc != nil }
      .map { $0.desc }
      .map { $0.map { $0.asViewModel() } }
      .map { $0.mapToEditDescriptionSections() }
    
    guard let adapter = specializedView.adapter else { return }
    
    Observable.of(
      empty,
      editDescription
    )
      .merge()
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}
