
import Foundation

struct InitialWeather: Codable {
    let daily: Daily
}

struct Daily: Codable {
    let dates: [String]
    let temperatures: [Double]
    let clouds: [Double]
    let snows: [Double]
    let rains: [Double]

    enum CodingKeys: String, CodingKey {
        case dates = "time"
        case temperatures = "temperature_2m_max"
        case clouds = "uv_index_clear_sky_max"
        case snows = "snowfall_sum"
        case rains = "rain_sum"
    }
}

struct Weather: Codable, Identifiable {
    let date: String
    let temperature: Int
    var id = UUID()
    let icon: String
}

