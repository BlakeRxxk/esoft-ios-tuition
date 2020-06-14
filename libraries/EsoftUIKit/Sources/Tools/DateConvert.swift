//
//  DateConvert.swift
//  EsoftUIKit
//
//  Created by nedstar on 14.06.2020.
//

import Foundation

public func stringToDate(from: String, with format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = format
  return dateFormatter.date(from: from)
}


public func dateToString(from: Date) -> String {
  DateFormatter().string(from: from)
}
