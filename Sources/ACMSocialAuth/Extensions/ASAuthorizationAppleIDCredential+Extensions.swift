//
//  ASAuthorizationAppleIDCredential+Extensions.swift
//
//
//  Created by burak on 4.02.2024.
//

import AuthenticationServices

extension ASAuthorizationAppleIDCredential {
    var toACM: ACMSocialAuthModel {
        ACMSocialAuthModel(authorizationCode: authorizationCode,
                           email: email,
                           fullName: fullName?.toString,
                           identityToken: identityToken,
                           state: state,
                           user: user,
                           appleDirection: .login)
    }
}
