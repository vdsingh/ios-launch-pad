//
//  FeatureTarget.swift
//  ProjectDescriptionHelpers
//
//  Created by Vikram Singh on 10/13/24.
//

@preconcurrency import ProjectDescription

public protocol FeatureTarget {
    var targetType: FeatureTargetType { get }
    var moduleDependencies: [String] { get }
    var externalDependencies: [String] { get }
    var infoPlist: InfoPlist { get }
    var nameOverride: String? { get }
    var sourcesPath: String { get }
}

public enum FeatureTargetType: Equatable {
    case framework
    case unitTests
    case app
}
