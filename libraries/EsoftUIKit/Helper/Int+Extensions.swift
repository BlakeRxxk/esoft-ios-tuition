//
//  Int+Extensions.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 16.06.2020.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        Formatter.withSeparator.string(for: self) ?? ""
    }
} 
