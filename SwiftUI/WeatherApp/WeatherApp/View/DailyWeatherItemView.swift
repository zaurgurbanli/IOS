//
//  DailyWeatherItemView.swift
//  WeatherApp
//
//  Created by Zaur Gurbanli on 12.06.24.
//

import SwiftUI

struct DailyWeatherItemView: View {
    var image: String
    var title: String
    var temp: Int
    
    var body: some View {
        VStack(alignment: .center){
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.multicolor)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding(.trailing)
    }
}

#Preview {
    DailyWeatherItemView(image: "MON", title: "cloud.sun.fill", temp: 24)
}
