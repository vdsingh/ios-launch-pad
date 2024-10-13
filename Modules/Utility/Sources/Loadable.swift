//
//  Loadable.swift
//  PullUp-iOS
//
//  Created by Vikram Singh on 11/8/23.
//

import Foundation
//import IdentifiedCollections

// MARK: - Loadable

public enum Loadable<T> {

    /// Nothing has happened yet
    case idle

    /// The data is currently loading
    case loading

    /// The data has successfully loaded
    case success(T)

    /// The data failed to load with error
    case failed(Error)
}

extension Loadable where T == Array<Any> {
    public func appendIfPossible(_ value: T) -> Loadable<T>? {
        switch self {
        case .success(let t):
            let value = t + value
            return .success(value)
        default:
            return nil
        }
    }
}



public extension Loadable {
    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }

    var hasInitialized: Bool {
        switch self {
        case .idle:
            return false
        default:
            return true
        }
    }

    var finished: Bool {
        switch self {
        case .success, .failed:
            return true
        default:
            return false
        }
    }

    var successful: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }

    var failed: Bool {
        switch self {
        case .failed:
            return true
        default:
            return false
        }
    }

    var value: T? {
        if case let .success(value) = self {
            return value
        }

        return nil
    }

    func map<N>(_ mapped: @escaping (T) -> N) -> Loadable<N> {
        switch self {
        case .idle:
            return .idle
        case .loading:
            return .loading
        case let .success(item):
            return .success(mapped(item))
        case let .failed(error):
            return .failed(error)
        }
    }
}

// MARK: Equatable

extension Loadable: Equatable where T: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.success(lhs), .success(rhs)):
            return lhs == rhs
        case let (.failed(lhs), .failed(rhs)):
            return String(reflecting: lhs) == String(reflecting: rhs)
        case (.loading, .loading), (.idle, .idle):
            return true
        default:
            return false
        }
    }
}

public extension Loadable {
    init(capture body: @Sendable () async throws -> T) async {
        do {
            self = try await .success(body())
        } catch {
            self = .failed(error)
        }
    }
}
