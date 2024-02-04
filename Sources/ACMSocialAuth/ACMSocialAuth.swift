import AuthenticationServices
import CryptoKit
import Foundation

public final class ACMSocialAuth: NSObject {
    public static let shared = ACMSocialAuth()

    public func login(with provider: ACMSocialProviderType, onSuccess: @escaping ACMSocialProviderAuthSuccess, onError: @escaping ACMSocialProviderAuthError) {
        ACMSocialProviders.shared.login(with: provider, onSuccess: onSuccess, onError: onError)
    }
}
