//
//  PageModel.swift
//  Pinch
//
//  Created by Zaur Gurbanli on 24.02.22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName : String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
