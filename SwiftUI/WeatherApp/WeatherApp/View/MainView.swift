

import SwiftUI

struct ContentView: View {
    @ObservedObject var weather = WeatherFetcher()
   
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Berlin")
                    .padding(.top, 30)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image(systemName: "sun.max.fill")
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
                            DailyWeatherItemView(image: "cloud.sun.fill", title: data.date, temp: data.temperature)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading)
                    .padding(.horizontal, 20)
                })
                .scrollIndicators(.hidden)
                
                Spacer()
                
                NavigationLink(destination: MapView()) {
                    Text("Change location")
                        .font(.system(size: 20)).bold()
                        .foregroundStyle(.white)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 60).background(Color(.systemIndigo)).clipShape(.buttonBorder)
                }.padding(.bottom)
                
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
        }
    }
}

#Preview {
    ContentView()
}
