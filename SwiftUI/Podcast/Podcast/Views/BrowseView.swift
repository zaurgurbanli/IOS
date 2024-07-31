//
//  BrowseView.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import SwiftUI

struct BrowseView: View {
    @State private var selectedHeading: Int = 0
    @Namespace private var animationNS

    var body: some View {
        ScrollView{
            TabBar(onPressMenu: {}, onPressSearch: {}, animationNS: animationNS)
                .padding(.leading, 10)
                .padding(.trailing, 20)
            
            Text("Browse")
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.system(size: 48))
                .padding(.vertical, 35)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                HStack(spacing:24){
                    ForEach(headingsItem, id: \.id) { item in
                        HeadingsItemView(icon: item.icon, text: item.text, isActive: selectedHeading == item.id){
                            withAnimation {
                                selectedHeading = item.id
                            }
                        }
                    }
                }
            }.padding(.leading, 10)
                
        }
        .navigationBarBackButtonHidden()
        .padding(.leading, 20)
        .padding(.top, 20)
        .background(Color("background"))
        .scrollIndicators(.hidden)
        .ignoresSafeArea(.keyboard)
        .dismissKeyboardOnTap()
    }
}

#Preview {
    BrowseView()
}
