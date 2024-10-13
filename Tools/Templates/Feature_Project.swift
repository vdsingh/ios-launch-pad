import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "{{ModuleName}}",
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