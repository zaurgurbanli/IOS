//
//  SearchItem.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 21.07.24.
//

import SwiftUI

struct SearchItem: View {
    var image: String
    var title: String
    var time: String
    var author: String
    
    var body: some View {
        HStack(spacing: 0){
            Image(image)
                .resizable()
                .frame(width: 70, height: 65)
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading: 10, bottomTrailing: 0, topTrailing: 10)))
                .padding(.trailing, 16)
            VStack(alignment: .leading, spacing: 0){
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .padding(.bottom, 10)
                    .lineLimit(1)
                HStack(spacing: 0){
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(Color(hex: 0x898F97))
                        .padding(.trailing, 10)
                    
                    Text(time)
                        .foregroundStyle(Color(hex: 0x898F97))
                        .font(.system(size: 12))
                }
                Text(author)
                    .foregroundStyle(.white)
                    .font(.system(size: 12))
                    .padding(.top, 4)
                    .lineLimit(1)

            }
            Spacer()
        }
    }
}

#Preview {
    SearchItem(image: "newpodcast1", title: "Salam", time: "24:05:09", author: "Salam sagol").background(.green)
}
