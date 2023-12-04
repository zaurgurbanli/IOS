//
//  VideoModel.swift
//  Africa
//
//  Created by Zaur Gurbanli on 27.02.22.
//

import SwiftUI

struct Video : Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String { "video-\(id)" }
}
