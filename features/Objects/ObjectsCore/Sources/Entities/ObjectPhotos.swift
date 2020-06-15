//
//  ObjectPhotos.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 15.06.2020.
//

import Foundation

public struct ObjectPhotos {
    public let fileName: String
}

extension ObjectPhotos: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case fileName = "file_name"
  }
}
