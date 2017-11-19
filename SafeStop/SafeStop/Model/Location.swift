//
//  Location.swift
//  SafeStop
//
//  Created by Jacky on 11/7/17.
//  Copyright © 2017 Goaloop. All rights reserved.
//

import Foundation

class Location {
    
    let locationName : String
    let latitude : Float
    let longitude : Float
    
    init(address: String, lat: Float, long: Float) {
        locationName = address
        latitude = lat
        longitude = long
    }
}
