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

final class ACMSocialProviders: NSObject {
    static let shared = ACMSocialProviders()

    var onSuccess: ACMSocialProviderAuthSuccess?
    var onError: ACMSocialProviderAuthError?
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
