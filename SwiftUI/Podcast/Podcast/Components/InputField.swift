//
//  InputField.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 27.06.24.
//

import SwiftUI

struct InputField: View {
    @Binding var input: String
    @FocusState private var isFocused: Bool
    
    var icon: String
    var text: String
    var rotation: Double = 0
    
    var body: some View {
        HStack(spacing: 0){
            Image(systemName: icon)
                .frame(width: 16, height: 16)
                .foregroundStyle(Color(hex: 0x898F97))
                .padding(.leading, 5)
                .rotationEffect(.degrees(rotation))
            TextField(text: $input, prompt: Text(text).foregroundStyle(Color(hex: 0x898F97))) {}
                .foregroundStyle(.white)
                .font(.system(size: 14))
                .padding(.leading, 25)
                .padding(.vertical, 20)
                .focused($isFocused)
            Spacer()
        }
        .padding(.leading, 20)
        .onTapGesture {
            isFocused = true
        }
        .overlay(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 18, bottomLeading: 18, bottomTrailing: 0, topTrailing: 18)
                )
            .stroke(Color(hex: 0x898F97), lineWidth: 1)
        )       
    }
}

#Preview {
    @Previewable @State var input = ""
    return InputField(input: $input, icon: "envelope", text: "Text")
}
