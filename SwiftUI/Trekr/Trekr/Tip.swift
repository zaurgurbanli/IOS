//
//  Tip.swift
//  Trekr
//
//  Created by Zaur Gurbanli on 22.11.21.
//

import Foundation

struct Tip: Codable {
    let text: String
    let children: [Tip]?
}
