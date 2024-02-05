//
//  LoginManagerLoginResult+Extensions.swift
//
//
//  Created by burak on 4.02.2024.
//

import FBSDKLoginKit

extension LoginManagerLoginResult {
    var toACM: ACMSocialAuthModel {
        ACMSocialAuthModel(accessToken: token?.tokenString)
    }
}
