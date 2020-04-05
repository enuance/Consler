// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Consler",
    products: [
        .library(
            name: "Consler",
            targets: ["Consler"]),
    ],
    dependencies: [
        // 🧰 SPMUtilities for CLI Argument Parsing.
        .package(url: "https://github.com/apple/swift-package-manager", from: "0.5.0")
    ],
    targets: [
        .target(
            name: "Consler",
            dependencies: ["SPMUtility"]),
        .testTarget(
            name: "ConslerTests",
            dependencies: ["Consler"]),
    ]
)
