//
//  PersonNameComponents+Extensions.swift
//
//
//  Created by burak on 4.02.2024.
//

import AuthenticationServices

extension PersonNameComponents {
    var toString: String {
        var components: [String] = []

        if let givenName = givenName {
            components.append(givenName)
        }

        if let middleName = middleName {
            components.append(middleName)
        }

        if let familyName = familyName {
            components.append(familyName)
        }

        return components.joined(separator: " ")
    }
}
