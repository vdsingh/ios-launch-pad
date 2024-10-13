import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "{{ModuleName}}",
    featureTargets: [
        Framework(
            moduleDependencies: [],
            externalDependencies: []
        ),
        App(
            moduleDependencies: [
                "{{ModuleName}}",
            ],
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