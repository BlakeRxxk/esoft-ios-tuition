//
//  CitiesQuery.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import URLRequestKit

struct CitiesQuery {
  var url: URL {
    Request {
      Endpoint(baseURL: "us-central1-esoft-tuition-cloud.cloudfunctions.net", path: "offices", version: "")
    }.absoluteURL
  }
}