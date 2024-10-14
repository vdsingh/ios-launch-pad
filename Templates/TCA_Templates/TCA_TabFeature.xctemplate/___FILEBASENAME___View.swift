//___FILEHEADER___

import ComposableArchitecture
import SwiftUI

struct ___VARIABLE_moduleName___View: View {
    @Bindable private var store: StoreOf<___VARIABLE_moduleName___>
    
    init(store: StoreOf<___VARIABLE_moduleName___>) {
        self.store = store
    }

    //__ This is the body for the view
    var body: some View {
        TabView(selection: self.$store.selectedTab.sending(\.tabSelected)) {
            Tab1View(store: self.store.scope(state: \.tab1, action: \.tab1))
                .tabItem {
                    Label(___VARIABLE_moduleName___.Tab.tab1.title, systemImage: ___VARIABLE_moduleName___.Tab.tab1.icon)
                }
                .tag(___VARIABLE_moduleName___.Tab.tab1)
            
            Tab2View(store: self.store.scope(state: \.tab2, action: \.tab2))
                .tabItem {
                    Label(___VARIABLE_moduleName___.Tab.tab2.title, systemImage: ___VARIABLE_moduleName___.Tab.tab2.icon)
                }
                .tag(___VARIABLE_moduleName___.Tab.tab2)
            
            Tab3View(store: self.store.scope(state: \.tab3, action: \.tab3))
                .tabItem {
                    Label(___VARIABLE_moduleName___.Tab.tab3.title, systemImage: ___VARIABLE_moduleName___.Tab.tab3.icon)
                }
                .tag(___VARIABLE_moduleName___.Tab.tab3)
        }
    }
}

#Preview {
    ___VARIABLE_moduleName___View(
        store: Store(
            initialState: ___VARIABLE_moduleName___.State(selectedTab: .tab1),
            reducer: {
                ___VARIABLE_moduleName___()
            }
        )
    )
}

// MARK: - Tab Views

struct Tab1View: View {
    @Bindable private var store: StoreOf<Tab1Feature>

    init(store: StoreOf<Tab1Feature>) {
        self.store = store
    }

    var body: some View {
        Text("Tab 1 Content")
            .onAppear { self.store.send(.onAppear) }
    }
}

struct Tab2View: View {
    @Bindable private var store: StoreOf<Tab2Feature>

    init(store: StoreOf<Tab2Feature>) {
        self.store = store
    }

    var body: some View {
        Text("Tab 2 Content")
            .onAppear { self.store.send(.onAppear) }
    }
}

struct Tab3View: View {
    @Bindable private var store: StoreOf<Tab3Feature>

    init(store: StoreOf<Tab3Feature>) {
        self.store = store
    }

    var body: some View {
        Text("Tab 3 Content")
            .onAppear { self.store.send(.onAppear) }
    }
}