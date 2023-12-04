//
//  MapView.swift
//  Africa
//
//  Created by Zaur Gurbanli on 26.02.22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        let coordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let zoom = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        return MKCoordinateRegion(center: coordinates, span: zoom)
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        })
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 48, height: 48)
                    
                    VStack(spacing:3){
                        HStack{
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                        }
                        Divider()
                        
                        HStack{
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                        }
                    }
                }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
                    .padding()
                , alignment: .top
                
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
