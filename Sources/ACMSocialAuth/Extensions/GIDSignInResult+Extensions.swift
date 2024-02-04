//
//  GIDSignInResult+Extensions.swift
//  
//
//  Created by burak on 4.02.2024.
//

import GoogleSignIn

extension GIDSignInResult {
    var toACM: ACMSocialAuthModel {
        ACMSocialAuthModel()
    }
}
