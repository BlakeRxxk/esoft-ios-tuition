//
//  Typealias.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import IGListDiffKit

public typealias RxListSingleSectionCellConfigureBlock<E: ListDiffable, Cell: UICollectionViewCell> = (E, Cell) -> Void
public typealias RxListSingleSectionCellSizeBlock<E: ListDiffable> = (E, ListCollectionContext?) -> CGSize

public typealias WillDisplayObjectEvent = (object: ListDiffable, index: NSInteger)
public typealias DidEndDisplayingObjectEvent = (object: ListDiffable, index: NSInteger)
public typealias MoveObjectEvent = (object: ListDiffable, from: [ListDiffable], to: [ListDiffable])
public typealias ListWillEndDraggingEvent = (view: UICollectionView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
