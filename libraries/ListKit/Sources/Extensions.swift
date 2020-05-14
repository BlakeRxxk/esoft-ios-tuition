//
//  Extensions.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

extension NSString: SectionModelType {}

extension NSNumber: SectionModelType {}

extension String: SectionModelType {
  public typealias ObjectType = NSString
  public var object: NSString {
    self as NSString
  }
}

extension Int: SectionModelType {
  public typealias ObjectType = NSNumber
  public var object: NSNumber {
    self as NSNumber
  }
}

extension UInt: SectionModelType {
  public typealias ObjectType = NSNumber
  public var object: NSNumber {
    self as NSNumber
  }
}

extension Float: SectionModelType {
  public typealias ObjectType = NSNumber
  public var object: NSNumber {
    self as NSNumber
  }
}

extension Double: SectionModelType {
  public typealias ObjectType = NSNumber
  public var object: NSNumber {
    self as NSNumber
  }
}
