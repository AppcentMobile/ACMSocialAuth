import Foundation

public final class ACMSocialAuth: NSObject {
    public static let shared = ACMSocialAuth()

    public func login(with provider: ACMSocialProviderType, state: ACMSocialAuthState, onSuccess: @escaping ACMSocialProviderAuthSuccess, onError: @escaping ACMSocialProviderAuthError) {
        ACMSocialProviders.shared.login(with: provider, state: state, onSuccess: onSuccess, onError: onError)
    }
}
