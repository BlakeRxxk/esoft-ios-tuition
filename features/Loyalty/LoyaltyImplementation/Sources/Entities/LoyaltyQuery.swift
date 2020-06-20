//
//  LoyaltyQuery.swift
//  LoyaltyImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import URLRequestKit

struct LoyaltyQuery {
//  var cityID: Int
  
  var url: URL {
//    let filter = """
//      [\"AND\", [\"=\", \"is_realtor\", \"1\"],
//      [\"=\", \"city_id\", \"\(cityID)\"],
//      [\"<>\", \"user_status\", \"deleted\"],
//      [\"<>\", \"fio\", \"\"]]
//      """
//    let withQuery = "[[\"lk\", [\"select\", [\"id\", \"ries_id\"]] ]]"
//    let limit = 15
//    let offset = (page - 1) * limit
//    var searchRequestQuery: Query = Query([:])
//    if let searchQuery = search, !searchQuery.isEmpty {
//      searchRequestQuery = Query(["search": searchQuery])
//    }
    
    return Request {
      Endpoint(baseURL: "us-central1-esoft-tuition-cloud.cloudfunctions.net/", path: "loyaltyCompany", version: "")
//      Query(["filter": filter])
//      Query(["limit": String(limit)])
//      Query(["offset": String(offset)])
//      Query(["with": withQuery])
//      Query(["order": "{\"fio\": \"ASC\"}"])
//      count ? Query(["count": "1"]) : Query([:])
//      searchRequestQuery
    }.absoluteURL
  }
}
