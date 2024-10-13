import CounterUI
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        return true
    }
}

@main
struct CounterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // Uncomment f using TCA:
    // let appStore: StoreOf<CounterApp> = {
    //     let store = StoreOf<CounterApp>(
    //         initialState: CounterApp.State.init()
    //     ) {
    //         CounterApp()
    //     }

    //     store.send(.initialize)
    //     return store
    // }()


    var body: some Scene {
        WindowGroup {
            RootView(
                // Uncomment for using TCA:
                // store: self.appStore
            )
        }
    }
}

struct RootView: View {
    // Uncomment for using TCA:
    // @Bindable var store: StoreOf<CounterApp>

    var body: some View {
        CounterUIView()
    }
}

#Preview {
    // Uncomment for using TCA:
    // let appStore: StoreOf<CounterApp> = {
    //     let store = StoreOf<CounterApp>(
    //         initialState: CounterApp.State.init()
    //     ) {
    //         CounterApp()
    //     }

    //     store.send(.initialize)
    //     return store
    // }()
    return RootView(
        // Uncomment for using TCA: 
        // store: appStore
    )
}
