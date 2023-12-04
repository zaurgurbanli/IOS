//
//  AnimalListItemVIew.swift
//  Africa
//
//  Created by Zaur Gurbanli on 27.02.22.
//

import SwiftUI

struct AnimalListItemVIew: View {
    let animal: Animal
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .lineLimit(3)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AnimalListItemVIew_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListItemVIew(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
