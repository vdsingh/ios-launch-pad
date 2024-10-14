//___FILEHEADER___

import ComposableArchitecture
import Foundation

@Reducer
struct ___VARIABLE_moduleName___ {
    @ObservableState
    struct State: Equatable {
        // Add your state here
        var counter: Int = 0
    }

    enum Action: Equatable {
        // Add your actions here
        case onAppear
        case incrementButtonTapped
        case decrementButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case .incrementButtonTapped:
                state.counter += 1
                return .none
            case .decrementButtonTapped:
                state.counter -= 1
                return .none
            }
        }
    }
}