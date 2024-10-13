//
//  CachingLoadable.swift
//  PullUp-iOS
//
//  Created by Vikram Singh on 1/1/24.
//

import Foundation

struct CachingLoadable<T: Equatable>: Equatable {
    enum Status: Equatable {
        case success
        case loading
        case failed(Error)
        case idle

        static func == (lhs: Status, rhs: Status) -> Bool {
            switch (lhs, rhs) {
            case (.success, .success):
                return true
            case (.loading, .loading):
                return true
            case let (.failed(error1), .failed(error2)):
                return error1.localizedDescription == error2.localizedDescription
            case (.idle, .idle):
                return true
            default:
                return false
            }
        }
    }

    var status: Status
    var data: T

    func eraseToLoadable() -> Loadable<T> {
        switch self.status {
        case .success:
            return .success(self.data)
        case .loading:
            return .loading
        case .failed(let error):
            return .failed(error)
        case .idle:
            return .idle
        }
    }
}
