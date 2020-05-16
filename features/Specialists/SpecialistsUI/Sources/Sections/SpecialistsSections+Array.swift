//
//  SpecialistsSections+Array.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToSpecialistsSections() -> [SpecialistsSections] {
    map { obj -> SpecialistsSections in
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
