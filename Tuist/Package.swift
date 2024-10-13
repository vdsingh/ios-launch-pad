// swift-tools-version: 5.9
@preconcurrency import PackageDescription

#if TUIST
    @preconcurrency import ProjectDescription
    import ProjectDescriptionHelpers
    import Foundation

    let packageSettings = PackageSettings(
        productTypes: [:]
    )

#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "shared-state-beta"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", .upToNextMinor(from: "1.15.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.7.1"),
        .package(url: "https://github.com/hmlongco/Factory", exact: "2.4.0")
    ]
)
