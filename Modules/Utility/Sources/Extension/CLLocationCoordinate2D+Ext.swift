//
//  CLLocationCoordinate2D+Ext.swift
//  PullUp-iOS
//
//  Created by Vikram Singh on 11/29/23.
//

import CoreLocation
import Foundation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
