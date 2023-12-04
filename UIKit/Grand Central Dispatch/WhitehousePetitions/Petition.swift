//
//  Petition.swift
//  WhitehousePetitions
//
//  Created by Zaur Gurbanli on 19.11.23.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
