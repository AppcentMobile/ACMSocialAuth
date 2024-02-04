//
//  Data+Extensions.swift
//
//
//  Created by burak on 4.02.2024.
//

import Foundation

extension Data {
    var toString: String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}
