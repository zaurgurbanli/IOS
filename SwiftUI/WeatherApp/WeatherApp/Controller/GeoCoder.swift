//
//  GeoCoder.swift
//  WeatherApp
//
//  Created by Zaur Gurbanli on 24.06.24.
//

import CoreLocation

class GeoCoder: ObservableObject {
    let geocoder = CLGeocoder()
    static let noCityText = "No City"
    @Published var text = noCityText

    
    func reverseGeocode(location: CLLocation) async {
        let location = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        if let city = try? await geocoder.reverseGeocodeLocation(location)
            .first
            .flatMap({ placemark in
                return placemark.locality
            })
        {
            DispatchQueue.main.async {
                self.text = city
            }
        }
        else {
            DispatchQueue.main.async {
                self.text = Self.noCityText
            }
        }
    }
}

