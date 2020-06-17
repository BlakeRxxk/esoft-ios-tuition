//
//  CountryQuery.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import URLRequestKit

struct CountriesQuery {
  var url: URL {
    Request {
      Endpoint(baseURL: "us-central1-esoft-tuition-cloud.cloudfunctions.net", path: "countries", version: "")
    }.absoluteURL
  }
}
