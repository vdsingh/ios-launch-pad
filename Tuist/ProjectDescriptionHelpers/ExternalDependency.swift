//
//  ExternalDependency.swift
//  BundlePlugin
//
//  Created by Vikram Singh on 2/17/24.
//

import Foundation
import ProjectDescription

public enum ExternalDependency: CaseIterable {
    case activityIndicatorView
    case composableArchitecture
    case concurrencyExtras
    case dependencies
    case firebaseAnalytics
    case firebaseRemoteConfig
    case floatingButton
    case floatingPanel
    case fuse
    case grpc
    case identifiedCollections
    case keychainAccess
    // case mediaPicker
    case rxrelay
    case rxswift
    case snapshotTesting
    case supertokens
    case swiftEntryKit
    case swiftProtobuf
    case swiftUIIntrospect
    
    public var name: String {
        return switch self {
        case .composableArchitecture:
            "ComposableArchitecture"
        case .identifiedCollections:
            "IdentifiedCollections"
        case .snapshotTesting:
            "SnapshotTesting"
        case .firebaseAnalytics:
            "FirebaseAnalytics"
        case .firebaseRemoteConfig:
            "FirebaseRemoteConfig"
        case .fuse:
            "Fuse"
        case .concurrencyExtras:
            "ConcurrencyExtras"
        case .swiftEntryKit:
            "SwiftEntryKit"
        case .dependencies:
            "Dependencies"
        case .grpc:
            "GRPC"
        case .swiftProtobuf:
            "SwiftProtobuf"
        case .supertokens:
            "SuperTokensIOS"
        case .activityIndicatorView:
            "ActivityIndicatorView"
        // case .mediaPicker:
        //     "ExyteMediaPicker"
        case .floatingButton:
            "FloatingButton"
        case .swiftUIIntrospect:
            "SwiftUIIntrospect"
        case .keychainAccess:
            "KeychainAccess"
        case .rxswift:
            "RxSwift"
        case .rxrelay:
            "RxRelay"
        case .floatingPanel:
            "FloatingPanel"
        }
    }

    public func mapToExternal() -> TargetDependency {
        return .external(name: self.name)
    }
}
