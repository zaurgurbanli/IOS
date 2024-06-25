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
    @Binding var pinLocation: CLLocationCoordinate2D
    @Binding var isLocationSelected: Bool
    @State var mkMapView: MKMapView = .init()
    @State var tempLoc: CLLocationCoordinate2D = CLLocationCoordinate2D()
    @State private var cameraProsition: MapCameraPosition = .automatic
    
    
    var body: some View {
        NavigationView {
            ZStack{
                MapReader { reader in
                    Map(position: $cameraProsition, interactionModes: [.all]){
                        Annotation(coordinate: tempLoc) {
                            Image("pin")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .padding(.bottom, 60)
                        } label: {}
                    }
                    .onTapGesture(perform: { screenCoord in
                        let loc = reader.convert(screenCoord, from: .local)
                        tempLoc = loc!
                    })
                    .onAppear {
                        tempLoc = pinLocation
                        cameraProsition = .camera(
                            MapCamera(
                                centerCoordinate: .init(latitude: pinLocation.latitude, longitude: pinLocation.longitude),
                                distance: 4000000,
                                heading: 0,
                                pitch: 0
                            )
                        )
                    }
                }
                
                VStack{
                    Spacer()
                    Button(action: {
                        isLocationSelected = true
                        pinLocation = tempLoc
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
    @State var loc = CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050)
    return MapView(pinLocation: $loc, isLocationSelected: .constant(false), tempLoc: loc)
}
