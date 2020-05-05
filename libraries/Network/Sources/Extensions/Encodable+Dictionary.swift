//
//  Encodable+Dictionary.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension Encodable {
  func dictionary(with encoder: JSONEncoder) -> [String: Any]? {
    guard let data = try? encoder.encode(self) else { return nil }
    
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
      .flatMap { $0 as? [String: Any] }
  }
}
