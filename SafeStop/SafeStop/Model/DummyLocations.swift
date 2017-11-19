//
//  DummyLocations.swift
//  SafeStop
//
//  Created by Jacky on 11/7/17.
//  Copyright © 2017 Goaloop. All rights reserved.
//

import Foundation

class DummyLocations {
    var dummyLocation = [Location]()
    
    init(){
        dummyLocation.append(Location(address: "oregon state university", lat: 44.5638, long: 123.2794))
        dummyLocation.append(Location(address: "university of oregon", lat: 44.0448, long: 123.0726))
        dummyLocation.append(Location(address: "fred meyer, corvallis", lat: 44.5752, long: 123.2742))
        dummyLocation.append(Location(address: "winco foods, corvallis", lat: 44.5908, long: 123.2744))
        dummyLocation.append(Location(address: "goodwill in corvallis", lat: 44.5785, long: 123.2597))
    }
}
