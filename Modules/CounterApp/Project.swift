import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "CounterApp",
    featureTargets: [
        Framework(
            moduleDependencies: [],
            externalDependencies: []
        ),
        UnitTests(
            moduleDependencies: [],
            externalDependencies: []
        ),
    ],
    includeResources: false
)
