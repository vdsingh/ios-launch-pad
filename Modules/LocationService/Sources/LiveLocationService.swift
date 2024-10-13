//
//  LiveLocationService.swift
//  LocationService
//
//  Created by Vikram Singh on 10/13/24.
//

import CoreLocation
import Foundation
import RxRelay
import RxSwift
import Utility

public final class LocationService {
    /// The `CLLocationManager` to interface with the system.
    private let locationManager = CLLocationManager()

    /// The `CLLocationManagerDelegate` to proxy updates.
    private lazy var delegate = LocationServiceDelegate(
        authorizationRelay: self.authorizationRelay,
        locationRelay: self.locationRelay
    )

    // MARK: - Relays

    private let disposeBag = DisposeBag()

    /// Controls starting/stopping location updates based on whether there are any subscribers.
    private var locationSubscribersCount: Int = 0 {
        didSet {
            if self.locationSubscribersCount > 0 {
                self.locationManager.startUpdatingLocation()
            } else {
                self.locationManager.stopUpdatingLocation()
            }
        }
    }

    /// Relay to broadcast `CLLocation` updates.
    private let locationRelay = BehaviorRelay<CLLocation?>(value: nil)

    /// Relay to broadcast authorization status updates.
    private lazy var authorizationRelay = BehaviorRelay<LocationAuthorizationStatus>(
        value: LocationAuthorizationStatus(self.locationManager.authorizationStatus)
    )

    init() {
        self.locationManager.delegate = self.delegate

        // Observe subscriptions to the location relay.
        self.locationRelay.do(
            onSubscribe: { [weak self] in
                self?.locationSubscribersCount += 1
            },
            onDispose: { [weak self] in
                self?.locationSubscribersCount -= 1
            }
        )
        .subscribe()
        .disposed(by: self.disposeBag)
    }

    // MARK: - Delegate
    /// A `CLLocationManagerDelegate` type to proxy updates.
    final class LocationServiceDelegate: NSObject, CLLocationManagerDelegate {
        private let authorizationRelay: BehaviorRelay<LocationAuthorizationStatus>
        private let locationRelay: BehaviorRelay<CLLocation?>

        init(
            authorizationRelay: BehaviorRelay<LocationAuthorizationStatus>,
            locationRelay: BehaviorRelay<CLLocation?>
        ) {
            self.authorizationRelay = authorizationRelay
            self.locationRelay = locationRelay
        }

        // MARK: - Delegate Functions

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            self.locationRelay.accept(locations.first)
        }

        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            self.authorizationRelay.accept(LocationAuthorizationStatus(manager.authorizationStatus))
        }

        // TODO:

        func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {

        }

        func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {

        }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

        }
    }
}

// MARK: - LocationServiceInterface Conformance

extension LocationService: LocationServiceInterface {
    public var authorizationStatus: StateProvider<LocationAuthorizationStatus> {
        self.authorizationRelay.asStateProvider()
    }

    public var location: StateProvider<CLLocation?> {
        self.locationRelay.asStateProvider()
    }

    public func requestAuthorization(_ type: AuthorizationType) {
        switch type {
        case .always:
            self.locationManager.requestAlwaysAuthorization()
        case .whenInUse:
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}
