//
//  SpecialistDetails+StatefulView.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import EsoftUIKit
import RxSwift
import RxCocoa
import ListKit
import SpecialistsImplementation
import StateKit
import IGListDiffKit.IGListDiffable
import RxExtensions

extension SpecialistDetails: StatefullView {
  public func bind(store: SpecialistDetailState) {
    let state = store.state.distinctUntilChanged().share().debug()
    
    let source = RxListAdapterDataSource<SpecialistDetailsSections>(sectionControllerProvider: {  _, section in
      switch section {
      case .empty:
        return EmptyListSectionController()
      case .detailsActions:
        return SpecialistDetailsActionSectionController()
      case .details:
        return SpecialistsDetailsSectionController()
      }
    })
    
    guard let adapter = specializedView.adapter else {
      return
    }
    
    state
      .map { [unowned self] in self.mapState(state: $0) }
      .map { $0.mapToSpecialistsDetailsSections() }
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
  
  private func mapState(state: SpecialistDetailState.State) -> [ListDiffable] {
    guard let specialist = state.specialist else { return [EmptyListViewModel(title: "", message: "", image: UIImage())] }
    var actions = [SpecialistDetailsActionViewModel(title: "chat",
                                                    value: "chat",
                                                    icon: UIImage.Consultant.base,
                                                    isActive: specialist.isChatAvailable())]

    if specialist.isMyManager {
      actions.append(SpecialistDetailsActionViewModel(title: "change",
                                                      value: "change",
                                                      icon: UIImage.autonew,
                                                      isActive: true))
    }
    return [specialist] + actions
  }
}
