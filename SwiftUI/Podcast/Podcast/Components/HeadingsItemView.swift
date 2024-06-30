//
//  HeadingsItemView.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import SwiftUI

struct HeadingsItemView: View {
    var icon: String
    var text: String
    var isActive: Bool
    var onPress: ()->Void
    
    var body: some View {
        VStack{
            Circle().fill(Color(hex: isActive ? 0x4A5865 : 0x19232F))
                .overlay {
                    Image(systemName: icon)
                        .frame(width: 22, height: 22)
                        .foregroundStyle(.white)
                }
                .frame(width: 56, height: 56)
            Text(text)
                .foregroundStyle(isActive ? .white : Color(hex: 0x898F97))
                .fontWeight(.medium)
                .font(.system(size: 12))
                .padding(.top, 16)
        }
        .onTapGesture {
            onPress()
        }
    }
}

#Preview {
    HeadingsItemView(icon: "key", text: "Category", isActive: false) {}
}
