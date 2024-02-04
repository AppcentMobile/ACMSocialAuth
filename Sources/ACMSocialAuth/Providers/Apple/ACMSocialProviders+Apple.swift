//
//  ACMSocialProviders+Apple.swift
//
//
//  Created by burak on 4.02.2024.
//

import AuthenticationServices
import Foundation

extension ACMSocialProviders {
    func apple() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = String.acmNonce

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.presentationContextProvider = UIWindow.presentationContextProvider
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
}

extension ACMSocialProviders: ASAuthorizationControllerDelegate {
    func authorizationController(controller _: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            ACMSocialProviders.shared.onSuccess?(appleIDCredential.toACM)
        default:
            ACMSocialProviders.shared.onError?(ACMSocialAuthError.notAuthorized)
        }
    }

    func authorizationController(controller _: ASAuthorizationController, didCompleteWithError error: Error) {
        ACMSocialProviders.shared.onError?(error)
    }
}
