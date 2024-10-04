import ProjectDescription
import BundlePlugin

public class Framework: FeatureTarget {
    public var targetType: FeatureTargetType {
        .framework
    }
    
    public let moduleDependencies: [String]
    public let externalDependencies: [ExternalDependency]
    public let infoPlist: InfoPlist
    public let nameOverride: String?
    public var sourcesPath: String

    public init(
        moduleDependencies: [String],
        externalDependencies: [ExternalDependency],
        sourcesPath: String = "Sources/**",
        infoPlist: InfoPlist = .default,
        nameOverride: String? = nil
    ) {
        self.moduleDependencies = moduleDependencies
        self.externalDependencies = externalDependencies
        self.infoPlist = infoPlist
        self.nameOverride = nameOverride
        self.sourcesPath = sourcesPath
    }
}

public class UnitTests: FeatureTarget {
    public var targetType: FeatureTargetType {
        .unitTests
    }
    
    public let moduleDependencies: [String]
    public let externalDependencies: [ExternalDependency]
    public let infoPlist: InfoPlist
    public let nameOverride: String?
    public var sourcesPath: String

    public init(
        moduleDependencies: [String],
        externalDependencies: [ExternalDependency],
        sourcesPath: String = "Tests/**",
        infoPlist: InfoPlist = .default,
        nameOverride: String? = nil
    ) {
        self.moduleDependencies = moduleDependencies
        self.externalDependencies = externalDependencies
        self.infoPlist = infoPlist
        self.nameOverride = nameOverride
        self.sourcesPath = sourcesPath
    }
}

public class App: FeatureTarget {
    public var targetType: FeatureTargetType {
        .app
    }
    
    public let moduleDependencies: [String]
    public let externalDependencies: [ExternalDependency]
    public let infoPlist: InfoPlist
    public let nameOverride: String?
    public var sourcesPath: String
    
    public init(
        moduleDependencies: [String],
        externalDependencies: [ExternalDependency],
        sourcesPath: String = "Sources/**",
        infoPlist: InfoPlist = .default,
        nameOverride: String? = nil
    ) {
        self.moduleDependencies = moduleDependencies
        self.externalDependencies = externalDependencies
        self.infoPlist = infoPlist
        self.nameOverride = nameOverride
        self.sourcesPath = sourcesPath
    }
    
    public static func example(
        moduleDependencies: [String],
        externalDependencies: [ExternalDependency],
        infoPlist: InfoPlist = .default,
        nameOverride: String? = nil
    ) -> App {
        App(moduleDependencies: moduleDependencies,
            externalDependencies: externalDependencies,
            sourcesPath: "Example/Sources/**",
            infoPlist: infoPlist,
            nameOverride: nameOverride)
    }
}

public protocol FeatureTarget {
    var targetType: FeatureTargetType { get }
    var moduleDependencies: [String] { get }
    var externalDependencies: [ExternalDependency] { get }
    var infoPlist: InfoPlist { get }
    var nameOverride: String? { get }
    var sourcesPath: String { get }
}

public enum FeatureTargetType: Equatable {
    case framework
    case unitTests
    case app
}

extension Project {
    /// Creates a Project for a Module
    /// - Parameters:
    ///   - name: The name of the module
    ///   - featureTargets: An array of FeatureTarget objects representing different targets for the module
    ///   - includeResources: A boolean indicating whether to include resources in the module
    /// - Returns: A Project for the module
    public static func module(
        _ name: String,
        featureTargets: [FeatureTarget],
        includeResources: Bool = false
    ) -> Project {
        var targets = [Target]()
        featureTargets.forEach { target in
            let dependencies = Self.mapModuleDependencies(target.moduleDependencies) +
            Self.mapExternalDependencies(target.externalDependencies)
            
            switch target.targetType {
            case .framework:
                targets.append(
                    Target.target(
                        name: name,
                        destinations: .iOS,
                        product: .staticFramework,
                        bundleId: .bundleId(for: name),
                        deploymentTargets: .iOS("17.0"),
                        infoPlist: target.infoPlist,
                        sources: ["\(target.sourcesPath)"],
                        resources: includeResources ? "Resources/**" : nil,
                        dependencies: dependencies,
                        additionalFiles: ["Project.swift"]
                    )
                )
                
            case .unitTests:
                targets.append(
                    Target.target(
                        name: "\(name)Tests",
                        destinations: .iOS,
                        product: .unitTests,
                        bundleId: .bundleId(for: "\(name)Tests"),
                        deploymentTargets: .iOS("17.0"),
                        infoPlist: .default,
                        sources: ["\(target.sourcesPath)"],
                        dependencies: dependencies
                    )
                )
                
            case .app:
                // Use the same resources path
                targets.append(
                    Target.target(
                        name: "\(name)App",
                        destinations: .iOS,
                        product: .app,
                        bundleId: .bundleId(for: "\(name)App"),
                        deploymentTargets: .iOS("17.0"),
                        infoPlist: target.infoPlist,
                        sources: ["\(target.sourcesPath)"],
//                        resources: target,
                        dependencies: dependencies,
                        additionalFiles: [
                            "Project.swift",
                        ]
                    )
                )
            }
        }
        
        return Project(name: name, targets: targets)
    }
    
    public static func customFramework(
        name: String,
        sourcesPath: String,
        externalDependencies: [ExternalDependency]
    ) -> Project {
        return Project(
            name: name,
            targets: [
                Target.target(
                    name: name,
                    destinations: .iOS,
                    product: .staticFramework,
                    bundleId: .bundleId(for: name),
                    deploymentTargets: .iOS("17.0"),
                    sources: ["\(sourcesPath)"],
                    dependencies: Self.mapExternalDependencies(externalDependencies),
                    additionalFiles: ["Project.swift"]
                )
            ]
        )
    }
    
    private static func mapModuleDependencies(_ depNames: [String]) -> [TargetDependency] {
        return depNames.map { .project(target: $0, path: "../\($0)") }
    }
    
    private static func mapExternalDependencies(_ extDeps: [ExternalDependency]) -> [TargetDependency] {
        return extDeps.map { .external(name: $0.name) }
    }
}