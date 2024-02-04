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
    func login(with provider: ACMSocialProviderType, state: ACMSocialAuthState, onSuccess: ACMSocialProviderAuthSuccess?, onError: ACMSocialProviderAuthError?) {
        ACMSocialProviders.shared.onSuccess = onSuccess
        ACMSocialProviders.shared.onError = onError

        switch provider {
        case .apple:
            apple(state: state)
        case .facebook:
            facebook(state: state)
        case .google:
            google(state: state)
        }
    }
}

extension ACMSocialProviders {
    func application(with provider: ACMSocialProviderType, application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) {
        switch provider {
        case .facebook:
            facebook(application: application, didFinishLaunchingWithOptions: launchOptions)
        case .google:
            return
        default:
            return
        }
    }
}
