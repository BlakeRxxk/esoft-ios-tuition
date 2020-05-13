//
//  AppTheme.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import ThemeManager
import Network
import RxSwift

public typealias AppTheme = ThemeManager

public struct Response<T: Codable & Hashable> {
  public let success: Bool
  public let status: Int
  public let data: T?
  
  public init(success: Bool,
              status: Int,
              data: T?) {
    self.success = success
    self.status = status
    self.data = data
  }
}

extension Response: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case success
    case status
    case data
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    success = try container.decode(Bool.self, forKey: .success)
    status = try container.decode(Int.self, forKey: .status)
    data = try container.decode(T.self, forKey: .data)
  }
}

public struct City {
  public let id: Int
  public let name: String
  public let coords: String?
  public let clockWrap: String?
  public let country: Int
  public let eOfficeID: Int?
  public let created: String
  public let updated: String
  
  public init(id: Int,
              name: String,
              coords: String?,
              clockWrap: String?,
              country: Int,
              eOfficeID: Int?,
              created: String,
              updated: String) {
    self.id = id
    self.name = name
    self.coords = coords
    self.clockWrap = clockWrap
    self.country = country
    self.eOfficeID = eOfficeID
    self.created = created
    self.updated = updated
  }
}

extension City: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case coords
    case clockWrap = "clock_wrap"
    case country
    case eOfficeID = "e_office_id"
    case created
    case updated
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    coords = try? container.decode(String.self, forKey: .coords)
    clockWrap = try? container.decode(String.self, forKey: .clockWrap)
    country = try container.decode(Int.self, forKey: .country)
    eOfficeID = try? container.decode(Int.self, forKey: .eOfficeID)
    created = try container.decode(String.self, forKey: .created)
    updated = try container.decode(String.self, forKey: .updated)
  }
}

final class CatalogsAPI: NetworkAPI {
  func getCities(url: URL) -> Single<Response<[City]>> {
    request(url: url)
  }
}
