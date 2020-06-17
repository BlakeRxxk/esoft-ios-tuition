//
//  MyCityQuery.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import Foundation
import URLRequestKit

struct MyCityQuery {
  var coords: (Double, Double)
  
  var url: URL {
    Request {
      Endpoint(baseURL: "us-central1-esoft-tuition-cloud.cloudfunctions.net", path: "myCity/\(coords.0)/\(coords.1)", version: "")
    }.absoluteURL
  }
}
