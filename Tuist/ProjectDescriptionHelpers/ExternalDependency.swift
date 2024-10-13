//
//  ExternalDependency.swift
//  BundlePlugin
//
//  Created by Vikram Singh on 2/17/24.
//

import Foundation
import ProjectDescription

public enum ExternalDependency: CaseIterable {
    case composableArchitecture
    case rxrelay
    case rxswift
    case snapshotTesting
    
    public var name: String {
        return switch self {
        case .composableArchitecture:
            "ComposableArchitecture"
        case .snapshotTesting:
            "SnapshotTesting"
        case .rxswift:
            "RxSwift"
        case .rxrelay:
            "RxRelay"
        }
    }

    public func mapToExternal() -> TargetDependency {
        return .external(name: self.name)
    }
}
