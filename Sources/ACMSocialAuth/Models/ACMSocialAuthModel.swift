//
//  ACMSocialAuthModel.swift
//
//
//  Created by burak on 4.02.2024.
//

import Foundation

public struct ACMSocialAuthModel {
    // MARK: Apple

    public var authorizationCode: Data? = nil
    public var authorizationCodeAsString: String {
        authorizationCode?.toString ?? ""
    }

    public var email: String? = nil
    public var fullName: String? = nil
    public var identityToken: Data? = nil
    public var identityTokenAsString: String {
        identityToken?.toString ?? ""
    }

    public var state: String? = nil
    public var user: String? = nil

    public var appleDirection: ACMSocialAuthState? = nil

    // MARK: Facebook

    public var accessToken: String? = nil

    // MARK: Google

    public var serverAuthCode: String? = nil
    public var profileImageUrl: URL? = nil
}
