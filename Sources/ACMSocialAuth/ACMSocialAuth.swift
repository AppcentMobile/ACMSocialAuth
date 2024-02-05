import UIKit

public final class ACMSocialAuth: NSObject {
    public static let shared = ACMSocialAuth()

    public func auth(with provider: ACMSocialProviderType, state: ACMSocialAuthState, appleScopes: [ACMSocialAuthAppleScope]? = nil, facebookScopes: [ACMSocialAuthFacebookScope]? = nil, onSuccess: @escaping ACMSocialProviderAuthSuccess, onError: @escaping ACMSocialProviderAuthError) {
        ACMSocialProviders.shared.auth(with: provider, state: state, appleScopes: appleScopes, facebookScopes: facebookScopes, onSuccess: onSuccess, onError: onError)
    }

    public func check(with provider: ACMSocialProviderType, onCheck: @escaping ACMSocialProviderAuthCheck) {
        ACMSocialProviders.shared.check(with: provider, onCheck: onCheck)
    }

    public func application(with provider: ACMSocialProviderType, application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
    {
        ACMSocialProviders.shared.application(with: provider, application: application, didFinishLaunchingWithOptions: launchOptions)
    }

    public func application(with provider: ACMSocialProviderType, app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) {
        ACMSocialProviders.shared.application(with: provider, app: app, open: url, options: options)
    }
}
