// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let FSVideoKitVersion = "2.0.4"
let FSVideoKitChecksum = "7097e8e7167ba4da6b38e730719c2880c1b390b44fc74131ee7029e291d45b96"

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
