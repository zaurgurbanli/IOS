//
//  FruitModel.swift
//  Fructus
//
//  Created by Zaur Gurbanli on 25.02.22.
//

import SwiftUI

struct Fruit: Identifiable{
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
    
}
