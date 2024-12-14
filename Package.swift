// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LLamaSwift",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .watchOS(.v4),
        .tvOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "LLamaSwift",
            targets: ["LLamaSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ggerganov/llama.cpp", revision: "a89f75e1b7b90cb2d4d4c52ca53ef9e9b466aa45"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
    ],
    targets: [
        .target(
            name: "LLamaSwift",        
            dependencies: [
                .product(name: "llama", package: "llama.cpp"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "llama-cpp-swiftTests",
            dependencies: ["LLamaSwift"]
        ),
    ]
)
