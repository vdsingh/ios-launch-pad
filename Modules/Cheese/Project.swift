import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "Cheese",
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
