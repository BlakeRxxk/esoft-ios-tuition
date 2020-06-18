//
//  PasswordQuery.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import Foundation
import URLRequestKit

struct PasswordQuery {
  var url: URL {
    Request {
      Endpoint(baseURL: "us-central1-esoft-tuition-cloud.cloudfunctions.net", path: "isLoginAvalible", version: "")
    }.absoluteURL
  }
}
