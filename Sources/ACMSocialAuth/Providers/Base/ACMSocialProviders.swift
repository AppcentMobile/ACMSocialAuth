//
//  ACMSocialProviders.swift
//
//
//  Created by burak on 4.02.2024.
//

import Foundation
import UIKit

public typealias ACMSocialProviderAuthSuccess = (ACMSocialAuthModel) -> Void
public typealias ACMSocialProviderAuthError = (Error) -> Void
public typealias ACMSocialProviderAuthCheck = (Bool) -> Void

final class ACMSocialProviders: NSObject {
    static let shared = ACMSocialProviders()

    var onSuccess: ACMSocialProviderAuthSuccess?
    var onError: ACMSocialProviderAuthError?
    var onCheck: ACMSocialProviderAuthCheck?
}

extension ACMSocialProviders {
    func auth(with provider: ACMSocialProviderType, state: ACMSocialAuthState, appleScopes: [ACMSocialAuthAppleScope]? = nil, facebookScopes: [ACMSocialAuthFacebookScope]? = nil, onSuccess: ACMSocialProviderAuthSuccess?, onError: ACMSocialProviderAuthError?) {
        ACMSocialProviders.shared.onSuccess = onSuccess
        ACMSocialProviders.shared.onError = onError

        switch provider {
        case .apple:
            apple(state: state, scopes: appleScopes)
        case .facebook:
            facebook(state: state, scopes: facebookScopes)
        case .google:
            google(state: state)
        }
    }
}

extension ACMSocialProviders {
    func check(with provider: ACMSocialProviderType, onCheck: @escaping ACMSocialProviderAuthCheck) {
        ACMSocialProviders.shared.onCheck = onCheck

        switch provider {
        case .apple:
            checkApple()
        case .facebook:
            checkFacebook()
        case .google:
            checkGoogle()
        }
    }
}

extension ACMSocialProviders {
    func application(with provider: ACMSocialProviderType, application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
    {
        switch provider {
        case .facebook:
            facebook(application: application, didFinishLaunchingWithOptions: launchOptions)
        default:
            return
        }
    }
}

extension ACMSocialProviders {
    public func application(with provider: ACMSocialProviderType, app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) {
        switch provider {
        case .google:
            google(app: app, open: url, options: options)
        default:
            return
        }
    }
}
