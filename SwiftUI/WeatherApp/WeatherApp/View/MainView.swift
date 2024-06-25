import SwiftUI
import MapKit

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

struct MainView: View {
    @State var pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2D()
    @State var isLocationSelected: Bool = false
    @ObservedObject var weather = WeatherFetcher()
    @ObservedObject var geocoder = GeoCoder()
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationView{
            VStack{
                Text(geocoder.text)
                    .padding(.top, 30)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .task {
                        await geocoder.reverseGeocode(location: CLLocation(latitude: pinLocation.latitude, longitude: pinLocation.longitude))
                    }
                
                Image(systemName: weather.today?.icon ?? "cloud.sun.fill")
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.multicolor)
                    .frame(width: 150, height: 150)
                    .padding(.top, 10)
                Text("\(weather.today?.temperature ?? 0)°")
                    .padding(.vertical, 20)
                    .font(.system(size: 70))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                ScrollView(.horizontal, content: {
                    HStack{
                        ForEach(weather.weekdays, id: \.self.id) { data in
                            DailyWeatherItemView(image: data.icon, title: data.date, temp: data.temperature)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading)
                    .padding(.horizontal, 20)
                })
                .scrollIndicators(.hidden)
                
                Spacer()
                
                NavigationLink(destination: MapView(pinLocation: $pinLocation, isLocationSelected: $isLocationSelected)) {
                    Text("Change location")
                        .font(.system(size: 20)).bold()
                        .foregroundStyle(.white)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 60).background(Color(.systemIndigo)).clipShape(.buttonBorder)
                }.padding(.bottom)
                
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
        }
        .onAppear {
            weather.fetchWeather(location: locationManager.location)
            pinLocation = weather.coordinate
        }
        .onChange(of: pinLocation, {
                weather.fetchWeather(location: pinLocation)
        })
        .onChange(of: locationManager.isPermissionGranted) {
            weather.fetchWeather(location: locationManager.location)
            pinLocation = weather.coordinate
            Task{
                await geocoder.reverseGeocode(location: CLLocation(latitude: pinLocation.latitude, longitude: pinLocation.longitude))
            }
        }
        
    }
}

#Preview {
    MainView()
}
