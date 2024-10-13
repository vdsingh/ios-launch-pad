import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "CounterUI",
    featureTargets: [
        Framework(
            moduleDependencies: [],
            externalDependencies: []
        ),
        App(
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