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
            moduleDependencies: [
                "{{ModuleName}}",
            ],
            externalDependencies: []
        ),
    ],
    includeResources: false
)