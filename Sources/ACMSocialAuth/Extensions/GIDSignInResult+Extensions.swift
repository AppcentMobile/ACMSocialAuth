//
//  GIDSignInResult+Extensions.swift
//
//
//  Created by burak on 4.02.2024.
//

import GoogleSignIn

extension GIDSignInResult {
    func toACM(pictureSize: Int? = nil) -> ACMSocialAuthModel {
        ACMSocialAuthModel(email: user.profile?.email,
                           fullName: user.profile?.name,
                           serverAuthCode: serverAuthCode,
                           profileImageUrl: user.profile?.imageURL(withDimension: UInt(pictureSize ?? 512)))
    }
}
