//
//  MockLocationService.swift
//  LocationService
//
//  Created by Vikram Singh on 10/13/24.
//

import CoreLocation
import RxRelay
import Utility

final class MockLocationService: LocationServiceInterface {

    var authorizationStatusRelay = BehaviorRelay<LocationAuthorizationStatus>(value: .notDetermined)
    public var authorizationStatus: StateProvider<LocationAuthorizationStatus> {
        self.authorizationStatusRelay.asStateProvider()
    }

    var locationRelay = BehaviorRelay<CLLocation?>(value: nil)
    public var location: StateProvider<CLLocation?> {
        self.locationRelay.asStateProvider()
    }

    // MARK: - Functions

    func requestAuthorization(_ type: AuthorizationType) {

    }
}
