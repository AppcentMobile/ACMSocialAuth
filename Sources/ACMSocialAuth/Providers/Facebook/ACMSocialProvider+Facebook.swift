//
//  ACMSocialProvider+Facebook.swift
//
//
//  Created by burak on 4.02.2024.
//

import FBSDKLoginKit
import Foundation

extension ACMSocialProviders {
    func facebook(state: ACMSocialAuthState, scopes: [ACMSocialAuthFacebookScope]? = [.profile, .email]) {
        let loginManager = LoginManager()

        switch state {
        case .login:
            guard let vc = UIWindow.lastWindow?.rootViewController, let scopes else { return }
            loginManager.logIn(permissions: scopes.map { $0.rawValue }, from: vc) { result, error in
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
        case .logout:
            loginManager.logOut()
        }
    }

    func checkFacebook() {
        onCheck?(AccessToken.current != nil)
    }
}

extension ACMSocialProviders {
    func facebook(application: UIApplication,
                  didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
    {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
