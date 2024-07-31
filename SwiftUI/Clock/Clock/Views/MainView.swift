//
//  ContentView.swift
//  Clock
//
//  Created by Zaur Gurbanli on 26.07.24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = ClockViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                ZStack {
                    ClockView()
                    
                    HandView(length: geometry.size.width/2, padding: 80, rotation: (viewModel.hour > 11 ? viewModel.hour - 12 : viewModel.hour)  * 30 + viewModel.minute * 0.5 )
                    
                    HandView(length: geometry.size.width/2, padding: 25, rotation: viewModel.minute * 6)

                    SecondHandView(second: viewModel.second)
                }
                .frame(width: geometry.size.width, height:  geometry.size.width)
                Spacer()
            }
        }
    }
   
}

#Preview {
    MainView()
}
