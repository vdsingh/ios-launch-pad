import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "CounterApp",
    featureTargets: [
        App(
            moduleDependencies: [
                "CounterUI"
            ],
            externalDependencies: []
        ),
        UnitTests(
            moduleDependencies: [],
            externalDependencies: []
        ),
    ],
    includeResources: false
)
