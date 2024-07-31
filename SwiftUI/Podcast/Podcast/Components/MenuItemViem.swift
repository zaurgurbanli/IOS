//
//  MenuItemViem.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 10.07.24.
//

import SwiftUI

struct MenuItemViem: View {
    var icon: String
    var title: String
    
    var body: some View {
        
        HStack{
            Image(systemName: icon)
                .frame(width: 16, height: 16)
                .foregroundStyle(Color(hex: 0x898F97))
                .padding(.trailing, 30)
            
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    MenuItemViem(icon: "globe", title: "Test")
}
