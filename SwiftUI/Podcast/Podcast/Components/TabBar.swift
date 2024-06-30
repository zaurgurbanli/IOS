//
//  TabBar.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import SwiftUI

struct TabBar: View {
    var onPressMenu: ()-> Void
    
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .frame(width: 45, height: 45)
            Text("Podcast")
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.leading, 10)
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .padding(10)
                .padding(.trailing)

            Button(action: onPressMenu, label: {
                Image(systemName:"line.3.horizontal")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                    .padding(10)
            })
            
        }
    }
}

#Preview {
    TabBar {}
}
