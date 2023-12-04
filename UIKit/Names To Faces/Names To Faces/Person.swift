//
//  Person.swift
//  Names To Faces
//
//  Created by Zaur Gurbanli on 21.11.23.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
