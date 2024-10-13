@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "LocationService",
    featureTargets: [
        Framework(
            moduleDependencies: [
                "Utility"
            ],
            externalDependencies: [
                "Factory",
                "RxRelay",
                "RxSwift",
            ]
        ),
        App.example(
            moduleDependencies: [
                "LocationService"
            ],
            externalDependencies: [
                "Factory"
            ],
            infoPlist: .extendingDefault(with: [
                "NSLocationWhenInUseUsageDescription": "When in use description",
                "NSLocationAlwaysUsageDescription": "Always description"
            ])
        ),
        UnitTests(
            moduleDependencies: [
                "LocationService"
            ],
            externalDependencies: []
        ),
    ],
    includeResources: false
)
