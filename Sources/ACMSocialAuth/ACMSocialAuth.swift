import UIKit

public final class ACMSocialAuth: NSObject {
    public static let shared = ACMSocialAuth()

    public func login(with provider: ACMSocialProviderType, state: ACMSocialAuthState, onSuccess: @escaping ACMSocialProviderAuthSuccess, onError: @escaping ACMSocialProviderAuthError) {
        ACMSocialProviders.shared.login(with: provider, state: state, onSuccess: onSuccess, onError: onError)
    }

    public func application(with provider: ACMSocialProviderType, application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) {
        ACMSocialProviders.shared.application(with: provider, application: application, didFinishLaunchingWithOptions: launchOptions)
    }
}
