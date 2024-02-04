//
//  ACMSocialProviders+Apple.swift
//
//
//  Created by burak on 4.02.2024.
//

import AuthenticationServices
import Foundation

extension ACMSocialProviders {
    func apple(state: ACMSocialAuthState, scopes: [String] = ["fullName", "email"]) {
        switch state {
        case .login:
            appleLogin(scopes: scopes)
        case .logout:
            appleLogout()
        }
    }

    private func appleLogin(scopes: [String]) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedOperation = .operationLogin

        request.requestedScopes = scopes.map { ASAuthorization.Scope($0) }
        request.nonce = String.acmNonce

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.presentationContextProvider = UIWindow.presentationContextProvider
        authorizationController.delegate = self
        authorizationController.performRequests()
    }

    private func appleLogout() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()

        request.requestedOperation = .operationLogout

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.performRequests()
    }
}

extension ACMSocialProviders: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let request = controller.authorizationRequests.first as? ASAuthorizationAppleIDRequest else { return }
        let requestedOperation = request.requestedOperation

        if requestedOperation == .operationLogin {
            switch authorization.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                ACMSocialProviders.shared.onSuccess?(appleIDCredential.toACM)
            default:
                ACMSocialProviders.shared.onError?(ACMSocialAuthError.notAuthorized)
            }
        } else if requestedOperation == .operationLogout {
            ACMSocialProviders.shared.onSuccess?(.init(appleDirection: .logout))
        }
    }

    func authorizationController(controller _: ASAuthorizationController, didCompleteWithError error: Error) {
        ACMSocialProviders.shared.onError?(error)
    }
}
