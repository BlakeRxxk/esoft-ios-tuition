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
    
    guard let adapter = specializedView.adapter else { return }
    
    state
      .map { [unowned self] in self.mapState(state: $0) }
      .map { $0.mapToEditDescriptionSections() }
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
    
  }
  
  private func mapState(state: EditDescriptionControllerState.State) -> [ListDiffable] {
    guard let sellerTicket = state.sellerTicket else { return [EmptyListViewModel(title: "", message: "", image: UIImage())] }
    return [sellerTicket]
  }
  
}
