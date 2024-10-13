//
//  Project.swift
//  PullUp-iOS
//
//  Created by Vikram Singh on 1/21/24.
//  Copyright © 2024 vikramsingh. All rights reserved.
//

@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    "Utility",
    featureTargets: [
        Framework(
            moduleDependencies: [],
            externalDependencies: [
                "RxRelay",
                "RxSwift",
            ]
        ),
        UnitTests(
            moduleDependencies: [],
            externalDependencies: []
        ),
    ],
    includeResources: false
)
