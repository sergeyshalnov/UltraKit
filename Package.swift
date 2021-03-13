// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UltraKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "UltraKit", targets: ["UltraKit"]),
    ],
    targets: [
        .target(name: "UltraKit", path: "Sources")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
