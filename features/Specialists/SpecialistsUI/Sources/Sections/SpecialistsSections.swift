//
//  SpecialistsSections.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum SpecialistsSections {
  case header(ListHeaderViewModel)
  case empty(EmptyListViewModel)
  
  case listHeaderSkeleton(ListHeaderSkeletonViewModel)
  case skeleton(ListSkeletonViewModel)
  case specialists(SpecialistViewModel)
}

extension SpecialistsSections: SectionModelType {
  public typealias ObjectType = ListDiffable
  
  public var object: ListDiffable {
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
