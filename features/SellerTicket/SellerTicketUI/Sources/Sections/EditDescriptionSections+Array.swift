//
//  EditDescriptionSections+Array.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToEditDescriptionSections() -> [EditDescriptionSections] {
    map { obj -> EditDescriptionSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is EmptyListViewModel:
        return .empty(obj as! EmptyListViewModel)
      case is EditDescriptionViewModel:
        return .editDescription(obj as! EditDescriptionViewModel)
      default:
        return .empty(EmptyListViewModel(title: "", message: "", image: UIImage()))
      }
    }
  }
}
