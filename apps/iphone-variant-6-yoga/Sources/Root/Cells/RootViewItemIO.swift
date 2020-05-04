//
//  RootViewItemIO.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

public protocol RootViewItemInput {
  var name: String { get }
}

public protocol RootViewItemOutput: AnyObject {
  func didTapRow(in cell: RootViewItemInput)
}
