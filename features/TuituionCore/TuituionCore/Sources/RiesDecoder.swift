//
//  RiesDecoder.swift
//  TuituionCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Network
import Foundation

public final class RiesDecoder: NetworkAPIDecoder {
  public init() {}
  
  public func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
    let responseData = try JSONDecoder().decode(Response<T>.self, from: data)
    
    return responseData.data!
  }
}
