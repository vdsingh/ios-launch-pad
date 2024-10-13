//
//  LocationAuthorizationStatus.swift
//  LocationService
//
//  Created by Vikram Singh on 10/13/24.
//

import CoreLocation

public enum LocationAuthorizationStatus {
    case notDetermined
    case restricted
    case denied
    case authorizedAlways
    case authorizedWhenInUse
    case unknown

    init(_ clStatus: CLAuthorizationStatus) {
        switch clStatus {
        case .notDetermined:
            self = .notDetermined
        case .restricted:
            self = .restricted
        case .denied:
            self = .denied
        case .authorizedAlways:
            self = .authorizedAlways
        case .authorizedWhenInUse:
            self = .authorizedWhenInUse
        case .authorized:
            self = .authorizedAlways
        @unknown default:
            self = .unknown
        }
    }

    public var displayString: String {
        switch self {
        case .authorizedAlways:
            return "Authorized Always"
        case .authorizedWhenInUse:
            return "Authorized When In Use"
        case .denied:
            return "Denied"
        case .restricted:
            return "Restricted"
        case .notDetermined:
            return "Not Determined"
        case .unknown:
            return "Unknown"
        }
    }
}
