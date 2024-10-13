import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "{{ModuleName}}",
    featureTargets: [
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