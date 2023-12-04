//
//  ContentView.swift
//  Trekr
//
//  Created by Zaur Gurbanli on 21.11.21.
//

import SwiftUI

struct ContentView: View {
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack {
                Image(location.heroPicture)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                
                Text(location.name)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(location.country)
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text(location.description)
                    .padding(.bottom)
                
                Text(location.more)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Discover")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(location: Locations().primary)
    }
}
