//
//  EditSellerPriceSections+Array.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToEditSellerPriceSections() -> [EditSellerPriceSections] {
    map { obj -> EditSellerPriceSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is EmptyListViewModel:
        return .empty(obj as! EmptyListViewModel)
      case is EditSellerPriceViewModel:
        return .editSellerPrice(obj as! EditSellerPriceViewModel)
      default:
        return .empty(EmptyListViewModel(title: "", message: "", image: UIImage()))
      }
    }
  }
}
