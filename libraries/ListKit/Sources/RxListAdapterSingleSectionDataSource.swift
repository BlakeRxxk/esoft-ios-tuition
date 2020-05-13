//
//  RxListAdapterSingleSectionDataSource.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import RxSwift

class ListAdapterSingleSectionDataSource: NSObject, ListAdapterDataSource {
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    []
  }
  
  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    ListSectionController()
  }
  
  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    nil
  }
}

// swiftlint:disable all
class RxListAdapterSingleSectionDataSourceSequenceWrapper<Collection: Sequence, Cell: UICollectionViewCell>:
RxListAdapterSingleSectionDataSource<Collection.Element, Cell>, RxListAdapterDataSourceType where Collection.Element: ListDiffable {
  public typealias Element = Collection
  
  override init(dequeueWay: CellDequeueWay,
                configureBlock: @escaping RxListSingleSectionCellConfigureBlock<Collection.Element, Cell>,
                sizeBlock: @escaping RxListSingleSectionCellSizeBlock<Collection.Element>,
                emptyViewProvider: EmptyViewProvider? = nil) {
    super.init(dequeueWay: dequeueWay, configureBlock: configureBlock, sizeBlock: sizeBlock, emptyViewProvider: emptyViewProvider)
  }
  
  // MARK: RxListAdapterDataSourceType
  public func listAdapter(_ adapter: ListAdapter, observedEvent: Event<Collection>) {
    switch observedEvent {
    case .next(let e):
      objects = Array(e)
      adapter.performUpdates(animated: true) { _ in
      }
    default:
      print(observedEvent)
    }
  }
}

protocol RxListSingleSectionControllerDelegate: AnyObject {
  associatedtype DiffableObject: ListDiffable
  func didSelect(_ sectionController: ListSingleSectionController, with object: DiffableObject)
  func didDeselect(_ sectionController: ListSingleSectionController, with object: DiffableObject)
}

class RxListAdapterSingleSectionDataSource<E: ListDiffable, Cell: UICollectionViewCell>: ListAdapterSingleSectionDataSource {
  enum CellDequeueWay {
    case cellClass(UICollectionViewCell.Type)
    case nib(name: String, bundle: Bundle?)
    case storyboard(id: String)
  }
  
  weak var delegate: ListSingleSectionControllerDelegate?
  
  let dequeueWay: CellDequeueWay
  let configureBlock: RxListSingleSectionCellConfigureBlock<E, Cell>
  let sizeBlock: RxListSingleSectionCellSizeBlock<E>
  let emptyViewProvider: EmptyViewProvider?
  
  init(dequeueWay: CellDequeueWay,
       configureBlock: @escaping RxListSingleSectionCellConfigureBlock<E, Cell>,
       sizeBlock: @escaping RxListSingleSectionCellSizeBlock<E>,
       emptyViewProvider: EmptyViewProvider? = nil) {
    self.dequeueWay = dequeueWay
    self.configureBlock = configureBlock
    self.sizeBlock = sizeBlock
    self.emptyViewProvider = emptyViewProvider
  }
  
  var objects: [E] = []
  
  // MARK: ListAdapterSingleSectionDataSource
  public override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return objects
  }
  
  public override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    switch dequeueWay {
    case .cellClass(let cellClass):
      let sc = ListSingleSectionController(cellClass: cellClass, configureBlock: { obj, cell in
        self.configureBlock(obj as!
          E, cell as! Cell)
      }, sizeBlock: { (obj, context) -> CGSize in
        self.sizeBlock(obj as! E, context)
      })
      sc.selectionDelegate = delegate
      return sc
    case .nib(let name, let bundle):
      let sc = ListSingleSectionController(nibName: name, bundle: bundle, configureBlock: { obj, cell in
        self.configureBlock(obj as!
          E, cell as! Cell)
      }, sizeBlock: { (obj, context) -> CGSize in
        self.sizeBlock(obj as! E, context)
      })
      sc.selectionDelegate = delegate
      return sc
    case .storyboard(let id):
      let sc = ListSingleSectionController(storyboardCellIdentifier: id, configureBlock: { obj, cell in
        self.configureBlock(obj as!
          E, cell as! Cell)
      }, sizeBlock: { (obj, context) -> CGSize in
        self.sizeBlock(obj as! E, context)
      })
      sc.selectionDelegate = delegate
      return sc
    }
  }
  
  public override func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return emptyViewProvider?(listAdapter)
  }
}
