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
        // 🧰 Terminal Controller.
        .package(url: "https://github.com/enuance/TerminalController", .exact("0.0.1"))
    ],
    targets: [
        .target(
            name: "Consler",
            dependencies: ["TerminalController"]),
        .testTarget(
            name: "ConslerTests",
            dependencies: ["Consler"]),
    ]
)
