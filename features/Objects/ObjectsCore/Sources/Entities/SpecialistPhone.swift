//
//  Speialist.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 17.06.2020.
//

import Foundation

public struct SpecialistPhone {
    public let phoneForMobile: String
}

extension SpecialistPhone: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case phoneForMobile = "phone_for_mobile"
  }
}
