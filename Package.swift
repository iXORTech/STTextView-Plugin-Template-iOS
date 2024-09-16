// swift-tools-version: 5.8

import PackageDescription

let pluginName = "Dummy"
let pluginTargetName = "\(pluginName)Plugin"

let package = Package(
    name: "STTextView-Plugin-\(pluginName)",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "STTextView\(pluginName)Plugin",
            targets: [pluginTargetName]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/iXORTech/STTextView", branch: "feat/ios-plugin-loading")
    ],
    targets: [
        .target(
            name: pluginTargetName,
            dependencies: [
                .product(name: "STTextView", package: "STTextView")
            ]
        )
    ]
)
