// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "Atomics": .staticFramework
        ],
        platforms: [.iOS]
    )

#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", .upToNextMinor(from: "1.5.0")),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", .upToNextMinor(from: "1.15.0")),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", .upToNextMinor(from: "10.18.0")),
        .package(url: "https://github.com/connor-ricks/swift-nibbles", exact: "0.4.0"),
        .package(url: "https://github.com/huri000/SwiftEntryKit", exact: "2.0.0"),
        .package(url: "https://github.com/grpc/grpc-swift.git", .upToNextMinor(from: "1.21.0")),
        .package(url: "https://github.com/supertokens/supertokens-ios", exact: "0.2.6")
    ]
)
