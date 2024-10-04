// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers
    import BundlePlugin
    import Foundation

    let packageSettings = PackageSettings(
        productTypes: [:
//            "Atomics": .staticFramework,
//            "CoreAudioTypes": .staticFramework
        ]
    )

#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "shared-state-beta"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.7.1"),
    ]
)
