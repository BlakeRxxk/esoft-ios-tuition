//
//  SellerTicketSections+Array.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToSellerTicketSections() -> [SellerTicketSections] {
    map { obj -> SellerTicketSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is EmptyListViewModel:
        return .empty(obj as! EmptyListViewModel)
      case is ListSkeletonViewModel:
        return .skeleton(obj as! ListSkeletonViewModel)
      case is ListHeaderSkeletonViewModel:
        return .listHeaderSkeleton(obj as! ListHeaderSkeletonViewModel)
      case is SellerTicketViewModel:
        return .sellerTicket(obj as! SellerTicketViewModel)
      default:
        return .empty(EmptyListViewModel(title: "", message: "", image: UIImage()))
      }
    }
  }
}
