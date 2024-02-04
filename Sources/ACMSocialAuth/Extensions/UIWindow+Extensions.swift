//
//  UIWindow+Extensions.swift
//
//
//  Created by burak on 4.02.2024.
//

import AuthenticationServices
import UIKit

extension UIWindow {
    static var lastWindow: UIWindow? {
        let windows = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
        return windows.last
    }

    static var presentationContextProvider: ASAuthorizationControllerPresentationContextProviding? {
        lastWindow?.rootViewController as? ASAuthorizationControllerPresentationContextProviding
    }
}
