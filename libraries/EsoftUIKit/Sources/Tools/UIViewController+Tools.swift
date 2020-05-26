//
//  UIViewController+Tools.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Atlas
import UIKit
import ThemeManager

extension UIViewController {
  static public func topbarHeight() -> CGFloat {
    let viewController = UINavigationController(rootViewController: UIViewController())
    let navBarHeight = viewController.navigationBar.frame.size.height
    let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
    return navBarHeight + statusBarHeight
  }
  
  public func addCloseButtonIfNeeded(target: AnyObject = self as AnyObject, action: Selector) {
    guard navigationController?.viewControllers.first === self else { return }
    
    let item = UIBarButtonItem()
    item.setStyles(UIBarButtonItem.Styles.close)
    item.target = target
    item.action = action
    navigationItem.leftBarButtonItem = item
  }
  
  public func addBackButtonIfNeeded(target: AnyObject = self as AnyObject, action: Selector) {
    guard navigationController?.viewControllers.first === self else { return }
    
    let item = UIBarButtonItem()
    item.setStyles(UIBarButtonItem.Styles.back)
    item.target = target
    item.action = action
    navigationItem.leftBarButtonItem = item
  }
  
  public func addInfoButtonIfNeeded(target: AnyObject = self as AnyObject, action: Selector) {
    guard navigationController?.viewControllers.first === self else { return }
    
    let item = UIBarButtonItem()
    item.setStyles(UIBarButtonItem.Styles.info)
    item.target = target
    item.action = action
    navigationItem.rightBarButtonItem = item
  }
  
  public func addLeftButtonIfNeeded(target: AnyObject = self as AnyObject, title: String, action: Selector) {
    guard navigationController?.viewControllers.first === self else { return }
    
    let item = UIBarButtonItem()
    item.title = title
    item.target = target
    item.action = action
    navigationItem.leftBarButtonItem = item
  }
  
  public func setupSearchController(searchController: UISearchController, searchResultsUpdater: UISearchResultsUpdating) {
    searchController.searchResultsUpdater = searchResultsUpdater
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true // что это?
    if #available(iOS 11, *) {
        self.navigationItem.searchController = searchController
        self.navigationItem.searchController?.isActive = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
  }
}
