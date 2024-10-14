//___FILEHEADER___

import ComposableArchitecture
import SwiftUI

struct ___VARIABLE_moduleName___View: View {
    @Bindable private var store: StoreOf<___VARIABLE_moduleName___>
    
    init(store: StoreOf<___VARIABLE_moduleName___>) {
        self.store = store
    }

    var body: some View {
        NavigationStack(path: self.$store.scope(state: \.path, action: \.path)) {
            VStack {
                Button("Navigate to Screen A") {
                    self.store.send(.button1Tapped)
                }

                Button("Navigate to Screen B") {
                    self.store.send(.button2Tapped)
                }
            }
        } destination: { store in
            switch store.case {
            case .screenA(let store):
                ScreenAView(store: store)
            case .screenB(let store):
                ScreenBView(store: store)
            }
        }
    }
}

#Preview {
    ___VARIABLE_moduleName___View(
        store: Store(
            initialState: ___VARIABLE_moduleName___.State(),
            reducer: {
                ___VARIABLE_moduleName___()
            }
        )
    )
}

// MARK: - Child Screen Views

struct ScreenAView: View {
    @Bindable private var store: StoreOf<ScreenAFeature>

    init(store: StoreOf<ScreenAFeature>) {
        self.store = store
    }

    var body: some View {
        Text("Screen A Content")
            .onAppear { self.store.send(.onAppear) }
    }
}

struct ScreenBView: View {
    @Bindable private var store: StoreOf<ScreenBFeature>

    init(store: StoreOf<ScreenBFeature>) {
        self.store = store
    }

    var body: some View {
        Text("Screen B Content")
            .onAppear { self.store.send(.onAppear) }
    }
}