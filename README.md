# ACMSocialAuth

ACMSocialAuth is a social authentication library that help developers to make social auth easily.

## Install

Via Cocoapods
```bash
pod 'ACMSocialAuth'
```

Via SPM, add new package, search url below
```bash
https://github.com/AppcentMobile/ACMSocialAuth
```

## Basic Usage

- Add app delegate helper methods

Facebook
```bash
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  ACMSocialAuth.shared.application(with: .facebook, application: application, didFinishLaunchingWithOptions: launchOptions)
  return true
}
```

Google
```bash
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
  ACMSocialAuth.shared.application(with: .google, app: app, open: url, options: options)
  return true
}
```

- Call social authorization requests with supported providers [Apple, Facebook, Google] and state [login, logout]
```bash
ACMSocialAuth.shared.login(with: .google, state: .login) { model in
    print(model)
} onError: { error in
    print(error)
}
```

## License

 * Apache License 2.0 ([LICENCE-Apache-2.0](LICENCE) or https://opensource.org/license/apache-2-0/)

