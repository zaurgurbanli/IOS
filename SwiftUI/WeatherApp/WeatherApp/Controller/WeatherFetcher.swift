//
//  WeatherFetcher.swift
//  WeatherApp
//
//  Created by Zaur Gurbanli on 12.06.24.
//

import Foundation
import CoreLocation
import Alamofire

class WeatherFetcher: ObservableObject {
    @Published var today: Weather?
    @Published var weekdays = [Weather]()
    @Published var coordinate = CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050)
    
    func fetchWeather(location: CLLocationCoordinate2D? ) {
        let lat = location?.latitude ?? coordinate.latitude
        let long = location?.longitude ?? coordinate.longitude
        
        coordinate.latitude = lat
        coordinate.longitude = long
        
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(long)&daily=temperature_2m_max,uv_index_clear_sky_max,rain_sum,snowfall_sum&timezone=\(TimeZone.current)&forecast_days=8")!
                
        AF.request(url, method: .get ).responseDecodable(of: InitialWeather.self) { response in
            if let weatherData = response.value {
                
                DispatchQueue.main.async {
                    self.weekdays = []
                    for i in 1...weatherData.daily.dates.count {
                        let rain = weatherData.daily.rains[i-1]
                        let cloud = weatherData.daily.clouds[i-1]
                        let snow = weatherData.daily.snows[i-1]
                        let date = weatherData.daily.dates[i-1]
                        let temperature = Int(weatherData.daily.temperatures[i-1])
                        
                        var icon = ""
                        
                        if snow > 0 {
                            icon = "snowflake"
                        } else if rain > 30 {
                            icon = "cloud.rain.fill"
                        }else if cloud < 5 {
                            icon = "cloud.fill"
                        }else if cloud < 8 {
                            icon = "cloud.sun.fill"
                        }
                        else {
                            icon = "sun.max.fill"
                        }
                        
                        
                        if(i == 1){
                            self.today = Weather(date: weekday(date: date) , temperature: temperature, icon: icon)
                        }
                        else{
                            self.weekdays.append(Weather(date: weekday(date: date) , temperature: temperature,  icon: icon))
                        }
                    }
                    
                }
            }
        }
        
    }
}
