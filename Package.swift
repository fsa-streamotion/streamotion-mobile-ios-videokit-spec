// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let FSVideoKitVersion = "2.0.5"
let FSVideoKitChecksum = "75ce41515a0a6d9d3b9501422614623e133381b9b6eeb75047b60df9c3a11c38"

let package = Package(
    name: "FSVideoKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FSVideoKit",
            targets: ["FSVideoKitWrapper"]),
    ],
    dependencies: [
        .package(url: "https://bitbucket.org/npaw/lib-plugin-spm-ios.git", exact: "6.7.19")
    ],
    targets: [
        .target(
            name: "FSVideoKitWrapper",
            dependencies: [
                "FSVideoKitCore",
                .product(name: "YouboraLib", package: "lib-plugin-spm-ios")
            ],
            path: "Sources/FSVideoKitWrapper"
        ),
        .binaryTarget(
            name: "FSVideoKitCore",
            url: "https://github.com/fsa-streamotion/streamotion-mobile-ios-videokit-spec/releases/download/\(FSVideoKitVersion)/FSVideoKit-\(FSVideoKitVersion).zip",
            checksum: FSVideoKitChecksum
        )
        
    ]
)
