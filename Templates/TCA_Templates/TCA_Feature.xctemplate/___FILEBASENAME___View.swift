//___FILEHEADER___

import ComposableArchitecture
import SwiftUI

struct ___VARIABLE_moduleName___View: View {
    @Bindable private var store: StoreOf<___VARIABLE_moduleName___>
    
    init(store: StoreOf<___VARIABLE_moduleName___>) {
        self.store = store
    }

    var body: some View {
        VStack {
            Text("Counter: \(self.store.counter)")
                .font(.title)
                .padding()
            
            HStack {
                Button(action: { store.send(.decrementButtonTapped) }) {
                    Image(systemName: "minus.circle")
                        .font(.title)
                }
                
                Button(action: { store.send(.incrementButtonTapped) }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                }
            }
        }
        .onAppear { store.send(.onAppear) }
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