//
//  ACMSocialProviders+Google.swift
//
//
//  Created by burak on 4.02.2024.
//

import GoogleSignIn
import UIKit

extension ACMSocialProviders {
    func google(state: ACMSocialAuthState, pictureSize: Int? = nil) {
        switch state {
        case .login:
            guard let vc = UIWindow.lastWindow?.rootViewController else { return }
            GIDSignIn.sharedInstance.signIn(withPresenting: vc) { result, error in
                if let error {
                    ACMSocialProviders.shared.onError?(error)
                } else if let result {
                    ACMSocialProviders.shared.onSuccess?(result.toACM(pictureSize: pictureSize))
                }
            }
        case .logout:
            GIDSignIn.sharedInstance.signOut()
        }
    }
}

extension ACMSocialProviders {
    func google(app _: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) {
        GIDSignIn.sharedInstance.handle(url)
    }
}
