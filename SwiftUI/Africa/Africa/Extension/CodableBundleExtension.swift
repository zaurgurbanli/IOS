//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Zaur Gurbanli on 26.02.22.
//

import Foundation

extension Bundle {
    func decode<T : Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Error occured")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Error occured")
        }
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else{
            fatalError("Error occured")
        }
        return loaded
    }
}
