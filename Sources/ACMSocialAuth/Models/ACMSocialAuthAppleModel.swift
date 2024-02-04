//
//  ACMSocialAuthAppleModel.swift
//
//
//  Created by burak on 4.02.2024.
//

import Foundation

public struct ACMSocialAuthAppleModel {
    public let authorizationCode: Data?
    public var authorizationCodeAsString: String {
        authorizationCode?.toString ?? ""
    }

    public let email: String?
    public let fullName: String?
    public let identityToken: Data?
    public var identityTokenAsString: String {
        identityToken?.toString ?? ""
    }

    public let state: String?
    public let user: String?
}
