//
//  NewPodcastItem.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import SwiftUI

struct NewPodcastItem: View {
    var bgImage: String
    var title: String
    var date: String
    var time: String
    var author: String
    var isNew: Bool = false
    var onPress: ()-> Void
    
    
    
    var body: some View {
        Image(bgImage)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.size.width - 60, height: 200)
            .overlay(
                LinearGradient(
                    colors: [.white.opacity(0), .black],
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                )
            )
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 30, bottomTrailing: 0, topTrailing: 30)))
            .overlay {
                ZStack(alignment: .topLeading){
                    if isNew {
                        Text("NEW")
                            .foregroundStyle(.white)
                            .fontWeight(.black)
                            .font(.system(size: 12))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 11)
                            .background(Color(hex: 0xFF334B))
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                            .padding(.leading, 30)
                            .padding(.top, -11)
                    }
                    
                    VStack{
                        Text(title)
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        HStack{
                            VStack{
                                HStack(alignment: .center, spacing: 0){
                                    Text(date)
                                        .foregroundStyle(Color(hex: 0x898F97))
                                        .fontWeight(.medium)
                                        .font(.system(size: 13))
                                    
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 13, height: 13)
                                        .foregroundStyle(Color(hex: 0x898F97))
                                        .padding(.horizontal, 10
                                        )
                                    
                                    Text(time)
                                        .foregroundStyle(Color(hex: 0x898F97))
                                        .fontWeight(.medium)
                                        .font(.system(size: 13))
                                    Spacer()
                                }
                                
                                HStack(alignment: .center, spacing: 0){
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .foregroundStyle(.white)
                                    
                                    Text(author)
                                        .foregroundStyle(.white)
                                        .fontWeight(.medium)
                                        .font(.system(size: 16))
                                        .padding(.leading, 8)
                                    Spacer()
                                }
                            }
                            Button(action: onPress, label: {
                                Circle()
                                    .foregroundStyle(Color(hex: 0xFF334B))
                                    .frame(width: 50, height: 50)
                                    .overlay {
                                        Image(systemName: "play")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(.white)
                                    }
                            })
                        }
                        
                    }
                    .padding(30)
                    
                }
                
            }
            .padding(.trailing, 20)
    }
}

#Preview {
    NewPodcastItem(bgImage: "newpodcast1", title: "About flow and our motivations", date: "28.06.2024", time: "12.04.40", author: "Zaur Gurbanli") {}
}
