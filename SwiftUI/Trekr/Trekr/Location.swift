//
//  Location.swift
//  Trekr
//
//  Created by Zaur Gurbanli on 21.11.21.
//

import Foundation

struct Location: Codable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
}
