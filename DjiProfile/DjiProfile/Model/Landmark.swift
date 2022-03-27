//
//  Landmark.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 25/03/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image : Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    //tính toán để tương tác với khung MapKit
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
