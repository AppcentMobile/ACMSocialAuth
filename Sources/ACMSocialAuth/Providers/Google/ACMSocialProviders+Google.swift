//
//  ACMSocialProviders+Google.swift
//
//
//  Created by burak on 4.02.2024.
//

import UIKit
import GoogleSignIn

extension ACMSocialProviders {
    func google(state: ACMSocialAuthState, pictureSize: Int? = nil) {
        guard let vc = UIWindow.lastWindow?.rootViewController else { return }
        GIDSignIn.sharedInstance.signIn(withPresenting: vc) { result, error in
            if let error {
                ACMSocialProviders.shared.onError?(error)
            } else if let result {
                ACMSocialProviders.shared.onSuccess?(result.toACM(pictureSize: pictureSize))
            }
        }
    }
}
