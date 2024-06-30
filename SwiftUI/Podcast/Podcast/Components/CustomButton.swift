//
//  CustomButton.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 27.06.24.
//

import SwiftUI

struct CustomButton<Destination: View>: View {
    var text: String
    var color: Color
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
        }
        .background(color)
        .cornerRadius(24)
        .shadow(color: color, radius: 8)
    }
}

#Preview {
    CustomButton(text: "Button", color: Color.blue, destination: EmptyView())
}
