// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ACMSocialAuth",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        .library(
            name: "ACMSocialAuth",
            targets: ["ACMSocialAuth"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/facebook/facebook-ios-sdk", from: "16.3.1"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "ACMSocialAuth",
            dependencies: [
                .product(name: "FacebookLogin", package: "facebook-ios-sdk"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
            ]
        ),
        .testTarget(
            name: "ACMSocialAuthTests",
            dependencies: ["ACMSocialAuth"]
        ),
    ]
)
