//
//  Location.swift
//  ToDoApp
//
//  Created by Андрей  on 08.04.2022.
//

import Foundation
import CoreLocation



struct Location {
    
    let name: String
    
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
    
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard lhs.coordinate?.latitude == rhs.coordinate?.latitude &&
              lhs.coordinate?.longitude == rhs.coordinate?.longitude &&
              lhs.name == rhs.name
              else { return false }
        return true
    }
}
