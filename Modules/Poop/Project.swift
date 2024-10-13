import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "Poop",
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
