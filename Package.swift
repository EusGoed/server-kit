// swift-tools-version: 5.8.1

import PackageDescription

let package = Package(
    name: "server-kit",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(
            name: "ServerKit",
            targets: ["ServerKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/queues.git", from: "1.12.1"),
        .package(url: "https://github.com/EusGoed/swift-log-pub.git", from: "1.0.1"),
        
    ],
    targets: [
        .target(
            name: "ServerKit",
        dependencies: [
            .product(name: "Vapor", package: "vapor"),
            .product(name: "JWTKit", package: "jwt-kit"),
            .product(name: "Fluent", package: "fluent"),
            .product(name: "Queues", package: "queues"),
            .product(name: "LoggingExt", package: "swift-log-pub"),
        ]),
        .testTarget(
            name: "ServerKitTests",
            dependencies: ["ServerKit"]),
    ]
)
