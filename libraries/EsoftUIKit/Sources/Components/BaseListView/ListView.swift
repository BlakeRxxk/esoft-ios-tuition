//
//  BaseListView.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import BaseFRP
import YogaKit
import IGListKit
import BaseUI

public class BaseListView: View {
  public private(set) var flowLayout: ListCollectionViewLayout = ListCollectionViewLayout(stickyHeaders: false,
                                                                                          scrollDirection: .vertical,
                                                                                          topContentInset: .zero,
                                                                                          stretchToEdge: true)
  public private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
  public private(set) lazy var refreshControl = UIRefreshControl()

  override public init() {
    super.init()

    createUI()
    configureUI()
  }

  private func createUI() {
    addSubview(collectionView)
  }

  private func configureUI() {}

  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
  }
}
