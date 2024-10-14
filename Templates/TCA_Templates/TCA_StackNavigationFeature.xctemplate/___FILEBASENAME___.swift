//___FILEHEADER___

import ComposableArchitecture
import Foundation

@Reducer
struct ___VARIABLE_moduleName___ {
    @Reducer(state: .equatable)
    public enum Path {
        case screenA(ScreenAFeature)
        case screenB(ScreenBFeature)
    }

    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
    }

    enum Action {
        case path(StackAction<Path.State, Path.Action>)

        case button1Tapped
        case button2Tapped
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .button1Tapped:
                state.path.append(.screenA(ScreenAFeature.State()))
                return .none
            case .button2Tapped:
                state.path.append(.screenB(ScreenBFeature.State()))
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

@Reducer
struct ScreenAFeature {
    @ObservableState
    struct State: Equatable {
        // Add Tab1 specific state here
    }
    
    enum Action: Equatable {
        case onAppear
        // Add Tab1 specific actions here
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                // Handle onAppear action
                return .none
            }
        }
    }
}

@Reducer
struct ScreenBFeature {
    @ObservableState
    struct State: Equatable {
        // Add Tab2 specific state here
    }
    
    enum Action: Equatable {
        case onAppear
        // Add Tab2 specific actions here
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                // Handle onAppear action
                return .none
            }
        }
    }
}