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
struct {{ModuleName}}: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // Uncomment f using TCA:
    // let appStore: StoreOf<{{ModuleName}}> = {
    //     let store = StoreOf<{{ModuleName}}>(
    //         initialState: {{ModuleName}}.State.init()
    //     ) {
    //         {{ModuleName}}()
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
    // @Bindable var store: StoreOf<{{ModuleName}}>

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    // Uncomment for using TCA:
    // let appStore: StoreOf<{{ModuleName}}> = {
    //     let store = StoreOf<{{ModuleName}}>(
    //         initialState: {{ModuleName}}.State.init()
    //     ) {
    //         {{ModuleName}}()
    //     }

    //     store.send(.initialize)
    //     return store
    // }()
    return RootView(
        // Uncomment for using TCA: 
        // store: appStore
    )
}
