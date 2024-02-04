//
//  ACMSocialProvider+Facebook.swift
//
//
//  Created by burak on 4.02.2024.
//

import FacebookLogin
import Foundation

extension ACMSocialProviders {
    func facebook() {
        guard let vc = UIWindow.lastWindow?.rootViewController else { return }
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"], from: vc) { result, error in
            if let error {
                ACMSocialProviders.shared.onError?(error)
            } else if let result {
                if result.isCancelled {
                    ACMSocialProviders.shared.onError?(ACMSocialAuthError.notAuthorized)
                } else {
                    ACMSocialProviders.shared.onSuccess?(result.toACM)
                }
            }
        }
    }
}
