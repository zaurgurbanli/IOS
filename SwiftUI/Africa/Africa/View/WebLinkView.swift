//
//  WebLinkView.swift
//  Africa
//
//  Created by Zaur Gurbanli on 27.02.22.
//

import SwiftUI

struct WebLinkView: View {
    var animal: Animal
    var body: some View {
        GroupBox{
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link)!)
                }
                .foregroundColor(.accentColor)
            }
            
        }
    }
}

struct WebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        WebLinkView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
