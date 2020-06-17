//
//  Formatter+Extensions.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 16.06.2020.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}
