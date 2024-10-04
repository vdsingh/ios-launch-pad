// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [],
        platforms: [.iOS]
    )

#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        // TODO: Add dependencies
        .package(url: "https://github.com/foo/bar", exact: "1.0.0"),
    ]
)
