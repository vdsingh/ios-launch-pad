import Foundation
import CoreLocation
import RxSwift
import Utility

/// Service that interfaces with system location.
public protocol LocationServiceInterface {
    /// Authorization status of the location service.
    var authorizationStatus: StateProvider<LocationAuthorizationStatus> { get }
    /// Location updates.
    var location: StateProvider<CLLocation?> { get }

    /// Requests location authorization of the specified type.
    /// - Parameter type: The authorization type to request.
    func requestAuthorization(_ type: AuthorizationType)
}

/// Authorization types that can be requested.
public enum AuthorizationType {
    case always
    case whenInUse
}
