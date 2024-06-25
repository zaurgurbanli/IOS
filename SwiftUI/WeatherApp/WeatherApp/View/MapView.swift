//
//  MapView.swift
//  WeatherApp
//
//  Created by Zaur Gurbanli on 24.06.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) var dismiss
    @State var pinLocation : CLLocationCoordinate2D = .init(latitude: CLLocationDegrees(52.5200), longitude: CLLocationDegrees(13.4050))
    @State var mkMapView: MKMapView = .init()
    
    @State private var cameraProsition: MapCameraPosition = .camera(
        MapCamera(
            centerCoordinate: .init(latitude: CLLocationDegrees(52.5200), longitude: CLLocationDegrees(13.4050)),
            distance: 4000000,
            heading: 0,
            pitch: 0
        )
    )
    
    var body: some View {
        NavigationView {
            ZStack{
                MapReader { reader in
                    Map(position: $cameraProsition, interactionModes: [.all]){
                        Annotation("Center", coordinate: pinLocation) {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30)
                            
                        }
                    }
                    .onTapGesture(perform: { screenCoord in
                        let loc = reader.convert(screenCoord, from: .local)
                        pinLocation = loc!
                    })
                }
                
                VStack{
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Select location")
                            .font(.system(size: 20)).bold()
                            .foregroundStyle(.white)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 60).background(Color(.systemIndigo)).clipShape(.buttonBorder)                    }).padding(.bottom)
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}



#Preview {
    MapView()
}
