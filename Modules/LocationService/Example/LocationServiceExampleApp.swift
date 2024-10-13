//
//  LocationServiceExampleApp.swift
//  LocationService
//
//  Created by Vikram Singh on 10/13/24.
//

import Factory
import SwiftUI
import LocationService
import RxSwift
import CoreLocation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        return true
    }
}

@main
struct LocationServiceExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

class LocationViewModel: ObservableObject {
    @Published var authorizationStatus: LocationAuthorizationStatus = .notDetermined
    @Published var location: CLLocation?

    private let disposeBag = DisposeBag()
    @Injected(\.locationService) private var locationService

    init() {
        // Subscribe to authorization status updates
        self.locationService.authorizationStatus.updates
            .subscribe(onNext: { [weak self] status in
                DispatchQueue.main.async {
                    self?.authorizationStatus = status
                }
            })
            .disposed(by: self.disposeBag)

        // Subscribe to location updates
        self.locationService.location.updates
            .subscribe(onNext: { [weak self] location in
                DispatchQueue.main.async {
                    self?.location = location
                }
            })
            .disposed(by: self.disposeBag)
    }

    func requestWhenInUseAuthorization() {
        self.locationService.requestAuthorization(.whenInUse)
    }

    func requestAlwaysAuthorization() {
        self.locationService.requestAuthorization(.always)
    }
}

struct RootView: View {
    @Injected(\.locationService) private var locationService
    @StateObject private var viewModel: LocationViewModel

    init() {
        _viewModel = StateObject(wrappedValue: LocationViewModel())
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Location Service Demo")
                .font(.title)
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text("Authorization Status:")
                    .font(.headline)
                Text(self.viewModel.authorizationStatus.displayString)
                    .foregroundColor(self.colorForStatus(viewModel.authorizationStatus))

                HStack {
                    Button {
                        self.viewModel.requestWhenInUseAuthorization()
                    } label: {
                        Text("Request When in Use")
                    }
                    .buttonStyle(.borderedProminent)

                    Button {
                        self.viewModel.requestAlwaysAuthorization()
                    } label: {
                        Text("Request Always")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text("Current Location:")
                    .font(.headline)
                if let location = self.viewModel.location {
                    Text("Latitude: \(location.coordinate.latitude)")
                    Text("Longitude: \(location.coordinate.longitude)")
                } else {
                    Text("Location not available.")
                        .foregroundColor(.gray)
                }
            }
            .padding()

            Spacer()
        }
    }

    // MARK: - Private Helpers

    private func colorForStatus(_ status: LocationAuthorizationStatus) -> Color {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return .green
        case .denied, .restricted:
            return .red
        case .notDetermined, .unknown:
            return .gray
        }
    }
}

#Preview {
    return RootView()
}
