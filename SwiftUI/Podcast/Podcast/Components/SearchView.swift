//
//  SearchView.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 20.07.24.
//

import SwiftUI

struct SearchView: View {
    @State var searchValue: String = ""
    @FocusState private var isFocused: Bool
    let animationNS: Namespace.ID
    
    @State var searchResult: [PodcastsItem] = []
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                HStack(spacing: 0){
                    TextField(text: $searchValue, prompt: Text("Type here...").foregroundStyle(Color(hex: 0x898F97))) {}
                        .foregroundStyle(.white)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .padding(.vertical, 20)
                        .focused($isFocused)
                        .onChange(of: searchValue) {
                            withAnimation {
                                searchResult = podcasts.filter({ item in
                                    item.title.contains(searchValue)
                                })
                            }
                        }
                        .onAppear {
                            isFocused = true
                        }
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                    
                        .frame(width: 16, height: 16)
                        .matchedGeometryEffect(id: "search", in: animationNS)
                        .foregroundStyle(Color(hex: 0x898F97))
                        .padding(.leading, 5)
                }
                .padding(.horizontal, 16)
                .onTapGesture {
                    isFocused = true
                }
                .background(Color(hex: 0x010304))
                .clipShape(RoundedRectangle(cornerRadius: 24))
                
                if (searchResult.count != 0) {
                    ScrollView{
                        VStack(spacing: 20){
                            ForEach(searchResult, id: \.id) { item in
                                SearchItem(image: item.bgImage, title: item.title, time: item.time, author: item.author)
                            }
                        }.padding(.vertical, 20)
                        
                    }
                    .padding(.horizontal, 8)
                    .scrollIndicators(.hidden)
                    .scrollBounceBehavior(.basedOnSize)
                }
                
            }
            .padding(16)
            .background(Color(hex: 0x19232F))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .frame(maxHeight: 2 * geometry.size.height / 3)
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
        }
        .transition(.fade)
    }
    
}

#Preview {
    @Previewable @Namespace var ns
    return SearchView( animationNS: ns)
}
