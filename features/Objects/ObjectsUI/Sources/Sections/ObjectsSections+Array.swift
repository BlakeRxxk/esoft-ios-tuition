//
//  ObjectsSections+Array.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 28.05.2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToObjectsSections() -> [ObjectsSections] {
    map { obj -> ObjectsSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is EmptyListViewModel:
        return .empty(obj as! EmptyListViewModel)
      case is ListSkeletonViewModel:
        return .skeleton(obj as! ListSkeletonViewModel)
      case is ListHeaderSkeletonViewModel:
        return .listHeaderSkeleton(obj as! ListHeaderSkeletonViewModel)
      case is ObjectsViewModel:
        return .objects(obj as! ObjectsViewModel)
      default:
        return .empty(EmptyListViewModel(title: "", message: "", image: UIImage()))
      }
    }
  }
}
