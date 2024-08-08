// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FSVideoKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FSVideoKit",
            targets: ["FSVideoKieXCFramework"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "FSVideoKieXCFramework",
            url: "https://github.com/fsa-streamotion/streamotion-mobile-ios-videokit-spec/raw/master/Archives/FSVideoKit-1.7.3.zip",
            checksum: "d1cb793399ae5a3b18ec86eb0e88800f7a3f22e3f57ace68f212170fb31fb360"
        ),
    ]
)
