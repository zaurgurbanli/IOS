//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Zaur Gurbanli on 27.02.22.
//

import SwiftUI

struct MapAnnotationView: View {
    
    let location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 50, height: 50)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 48, height: 48)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1-animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        })
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: locations[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
