//
//  DateFactory.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

public enum DateFactory {
  
  public static let dateOutputFormatter: DateFormatter = {
    $0.dateFormat = "yyyy-MM-dd"
    return $0
  }(DateFormatter())
  
  public static let monthOutputFormatter: DateFormatter = {
    $0.dateFormat = "yyyy-MM"
    return $0
  }(DateFormatter())
  
  public static let dateInputFormatter: DateFormatter = {
    $0.dateFormat = "dd.MM.yyyy"
    return $0
  }(DateFormatter())
  
  public static let monthInputFormatter: DateFormatter = {
    $0.dateFormat = "MM.yyyy"
    return $0
  }(DateFormatter())
  
  public static let timeInputFormatter: DateFormatter = {
    $0.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return $0
  }(DateFormatter())
  
  public static let timeOutputFormatter: DateFormatter = {
    $0.dateFormat = "HH:mm"
    return $0
  }(DateFormatter())
  
  public static let calendar = Calendar(identifier: .gregorian)
  
  private static func makeComponents(from period: String, negative: Bool) -> DateComponents {
    var components = DateComponents()
    
    var curIndex = period.index(after: period.startIndex)
    
    if let yearIndex = period.firstIndex(of: "Y"),
      let year = Int(period[curIndex..<yearIndex]) {
      components.year = negative ? -year : year
      curIndex = period.index(after: yearIndex)
    }
    
    if let monthIndex = period.firstIndex(of: "M"),
      let month = Int(period[curIndex..<monthIndex]) {
      components.month = negative ? -month : month
      curIndex = period.index(after: monthIndex)
    }
    
    if let dayIndex = period.firstIndex(of: "D"),
      let day = Int(period[curIndex..<dayIndex]) {
      components.day = negative ? -day : day
    }
    
    return components
  }
}
