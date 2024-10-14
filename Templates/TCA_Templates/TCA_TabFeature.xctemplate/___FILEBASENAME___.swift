//___FILEHEADER___

import ComposableArchitecture
import Foundation

@Reducer
struct ___VARIABLE_moduleName___ {
    //__ The basic state. Feel free to change this if needed.
    @ObservableState
    struct State: Equatable {
        var tab1 = Tab1Feature.State()
        var tab2 = Tab2Feature.State()
        var tab3 = Tab3Feature.State()

        var selectedTab: Tab
    }

    enum Tab: Equatable {
        case tab1
        case tab2
        case tab3

        var icon: String {
            switch self {
            case .tab1:
                "1.circle"
            case .tab2:
                "2.circle"
            case .tab3:
                "3.circle"
            }
        }
        
        var title: String {
            switch self {
            case .tab1:
                "Tab 1"
            case .tab2:
                "Tab 2"
            case .tab3:
                "Tab 3"
            }
        }
    }

    //__ The basic actions. Feel free to change this if needed.
    enum Action: Equatable {
        case tabSelected(Tab)

        case tab1(Tab1Feature.Action)
        case tab2(Tab2Feature.Action)
        case tab3(Tab3Feature.Action)
    }
    
    //__ You can add more properties if needed.
    //__ e.g: private let useCase: UseCase
    //__ If this is the case, you'll need to implement the init()
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .tabSelected(tab):
                state.selectedTab = tab
                return .none
            case .tab1, .tab2, .tab3:
                return .none
            }
        }

        Scope(state: \.tab1, action: \.tab1) {
            Tab1Feature()
        }

        Scope(state: \.tab2, action: \.tab2) {
            Tab2Feature()
        }
        
        Scope(state: \.tab3, action: \.tab3) {
            Tab3Feature()
        }
    }
}

// MARK: - Tab1Feature

@Reducer
struct Tab1Feature {
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

// MARK: - Tab2Feature

@Reducer
struct Tab2Feature {
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

// MARK: - Tab3Feature

@Reducer
struct Tab3Feature {
    @ObservableState
    struct State: Equatable {
        // Add Tab3 specific state here
    }
    
    enum Action: Equatable {
        case onAppear
        // Add Tab3 specific actions here
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