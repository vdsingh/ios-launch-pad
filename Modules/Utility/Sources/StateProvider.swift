//
//  StateProvider.swift
//  Utility
//
//  Created by Vikram Singh on 7/29/24.
//

import RxSwift
import RxRelay

public final class StateProvider<T> {
    public private(set) var updates: Observable<T>

    var getValue: () -> T
    
    public var value: T {
        self.getValue()
    }
    
    public init(observable: Observable<T>, getValue: @escaping () -> T) {
        self.updates = observable
        self.getValue = getValue
    }
}

extension StateProvider {
    public convenience init(relay: BehaviorRelay<T>) {
        self.init(observable: relay.asObservable()) {
            relay.value
        }
    }
    
    public func map<NewState>(_ transform: @escaping(T) -> NewState) -> StateProvider<NewState> {
        StateProvider<NewState>(observable: self.updates.map(transform), getValue: { transform(self.value) })
    }
    
    public static func just(_ value: T) -> StateProvider<T> {
        StateProvider(observable: .just(value), getValue: { value })
    }
}

extension BehaviorRelay {
    public func asStateProvider() -> StateProvider<Element> {
        StateProvider(relay: self)
    }
    
    public func mapToStateProvider<NewElement>(_ transform: @escaping(Element) -> NewElement) -> StateProvider<NewElement> {
        StateProvider(relay: self).map(transform)
    }
}

extension Observable {
    func asStateProvider(getValue: @escaping () -> Element) -> StateProvider<Element> {
        StateProvider(observable: self, getValue: getValue)
    }
}
