//
//  Accessors.swift
//  LocationService
//
//  Created by Vikram Singh on 10/13/24.
//

import Factory

public extension Container {
    var locationService: Factory<LocationServiceInterface> {
        Factory(self) { LocationService() }
    }
}
