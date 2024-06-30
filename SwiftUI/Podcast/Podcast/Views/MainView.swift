//
//  MainView.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedCategory: String = "Recent"
    @State var presentSideMenu = false
    private var categories = ["Recent", "Topics", "Authors", "Episodes"]
    
    var body: some View {
        ZStack{
            ScrollView{
                TabBar(onPressMenu: {
                    withAnimation {
                        presentSideMenu = true
                    }
                })
                .padding(.horizontal, 20)
                .padding(.leading, 10)
                
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(podcastsItem, id: \.id) { item in
                            NewPodcastItem(bgImage: item.bgImage, title: item.title, date: item.date, time: item.time, author: item.author, isNew: item.new) {}
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 15)
                    
                }
                .scrollIndicators(.hidden)
                .padding(.vertical, 30)
                
                Text("Listen podcasts")
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack{
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }, label: {
                            Text(category)
                                .font(.system(size: 16))
                                .foregroundStyle(selectedCategory == category ? Color(hex: 0x3E8BFF): Color(hex: 0x898F97 ))
                            
                        })
                        .padding(.horizontal, 12)
                    }
                    Spacer()
                }
                .padding(.horizontal, 18)
            }
            .navigationBarBackButtonHidden()
            .padding(.top, 20)
            .background(Color("background"))
            .scrollIndicators(.hidden)
            .ignoresSafeArea(.keyboard)
            .dismissKeyboardOnTap()

            if presentSideMenu {
                Color.black.opacity(0.5).frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea().onTapGesture {
                    withAnimation(.smooth) {
                        presentSideMenu = false
                    }
                }
                SideMenuView(presentSideMenu: $presentSideMenu)
            }
        }
    }
}

#Preview {
    MainView()
}
