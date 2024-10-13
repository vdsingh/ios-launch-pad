//
//  EquatableNoop.swift
//  PullUp-iOS
//
//  Created by Vikram Singh on 11/5/23.
//

import Foundation

@propertyWrapper
public struct EquatableNoop<Value>: Equatable {
    public var wrappedValue: Value

    public static func == (lhs: EquatableNoop<Value>, rhs: EquatableNoop<Value>) -> Bool {
        true
    }

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}
