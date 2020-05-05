//
//  RootViewItemSectionIO.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

public protocol RootViewItemSectionOutput: AnyObject {
  func didTapAction(in cell: RootViewItemInput)
}
