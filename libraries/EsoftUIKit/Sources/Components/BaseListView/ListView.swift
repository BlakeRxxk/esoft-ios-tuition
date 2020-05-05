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
import ThemeManager

public class BaseListView: View {
  public private(set) var adapter: ListAdapter?
  public private(set) var flowLayout: ListCollectionViewLayout = ListCollectionViewLayout(stickyHeaders: false,
                                                                                          scrollDirection: .vertical,
                                                                                          topContentInset: .zero,
                                                                                          stretchToEdge: true)
  public private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

  override public init() {
    super.init()
    
    self.adapter = ListAdapter(updater: ListAdapterUpdater(),
                               viewController: parentViewController,
                               workingRangeSize: 15)
    createUI()
    configureUI()
  }
  
  private func createUI() {
    addSubview(collectionView)
  }
  
  private func configureUI() {
    collectionView.backgroundColor = ThemeManager.current().colors.container
    adapter?.collectionView = collectionView
  }
  
  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    subviews.forEach {
      $0.yoga.markDirty()
    }
    yoga.applyLayout(preservingOrigin: true)
    super.traitCollectionDidChange(previousTraitCollection)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    collectionView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
  }
}

extension UIView {
  var parentViewController: UIViewController? {
    var parentResponder: UIResponder? = self
    while parentResponder != nil {
      parentResponder = parentResponder?.next
      if let viewController = parentResponder as? UIViewController {
        return viewController
      }
    }
    return nil
  }
}
