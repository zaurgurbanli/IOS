//
//  SideMenuView.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//


import SwiftUI

struct SideMenuView: View {
    var onClose: ()-> Void
    
    
    var body: some View {
        GeometryReader { geometry in
            
            HStack {
                Spacer()
                
           
                
                VStack(spacing: 20){
                    ZStack{
                        UnevenRoundedRectangle(bottomLeadingRadius: 40)
                            .fill(Color(hex: 0x060D15))
                        
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
                                Text("Hello,\nZaur!")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 28))
                                Spacer()
                                HStack{
                                    Button(action: {}, label: {
                                        Image(systemName: "bell")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .padding(15)
                                            .foregroundStyle(.white)
                                    })
                                    Button(action: onClose, label: {
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .padding(15)
                                            .foregroundStyle(.white)
                                    })
                                }
                                .padding(.top, -10)
                            }
                            .padding(.trailing, 15)
                            .padding(.leading, 30)
                            .padding(.top, geometry.safeAreaInsets.top)

                            Divider().frame(height: 1).background(.white).opacity(0.1).padding(.leading, 30)
                                .padding(.vertical, 20)

                            HStack(alignment: .center, spacing: 0){
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(.white)
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Listened time:")
                                        .foregroundStyle(.white)
                                        .fontWeight(.medium)
                                        .font(.system(size: 12))
                                    Text("24:15:05")
                                        .foregroundStyle(Color(hex: 0x898F97))
                                        .fontWeight(.medium)
                                        .font(.system(size: 12))
                                }
                                .padding(.leading, 24)
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Playlists:")
                                        .foregroundStyle(.white)
                                        .fontWeight(.medium)
                                        .font(.system(size: 12))
                                    Text("27")
                                        .foregroundStyle(Color(hex: 0x898F97))
                                        .fontWeight(.medium)
                                        .font(.system(size: 12))
                                }
                                .padding(.leading, 20)
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Following:")
                                        .foregroundStyle(.white)
                                        .fontWeight(.medium)
                                        .font(.system(size: 12))
                                    Text("188")
                                        .foregroundStyle(Color(hex: 0x898F97))
                                        .fontWeight(.medium)
                                        .font(.system(size: 12))
                                }
                                .padding(.leading, 20)

                                Spacer()
                            }.padding(.leading, 30)
                                .padding(.bottom, 36)

                        }
                    }
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    

                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, bottomLeading: 0, bottomTrailing: 0, topTrailing: 0)
                        )
                        .fill(Color(hex: 0x060D15))
                        .overlay {
                            ScrollView{
                                VStack{
                                    MenuItemViem(icon: "globe", title: "Browse")
                                    MenuItemViem(icon: "eye", title: "Subscribed")
                                    MenuItemViem(icon: "heart", title: "Favorites")
                                    MenuItemViem(icon: "clock.arrow.circlepath", title: "History")
                                    MenuItemViem(icon: "creditcard", title: "Payment")
                                    MenuItemViem(icon: "slider.horizontal.3", title: "Account Settings")
                                                                
                                    NavigationLink {
                                        LoginView()
                                    } label: {
                                        ZStack(alignment: .trailing){
                                            Text("Logout")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 16))
                                                .fontWeight(.medium)
                                                .padding(.vertical, 17)
                                                .frame(maxWidth: .infinity)
                                                .background(Color(hex: 0x19232F))
                                                .clipShape(.capsule )
                                            
                                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                                .frame(width: 16, height: 16)
                                                .foregroundStyle(Color(hex: 0x898F97))
                                                .padding(.trailing, 20)
                                            
                                            
                                        }
                                    }
                                    .padding(.top, 40)
                                    
                                }
                                .padding(.horizontal, 50)
                                .padding(.top, 50)
                                .padding(.bottom, 40)
                            }
                            .scrollIndicators(.hidden)
                            .scrollBounceBehavior(.basedOnSize)
                        }
                        
                       
                        

                }
                .frame(width: UIScreen.main.bounds.size.width * 0.85)

            }
            .background(.clear)
            .ignoresSafeArea()
            
        }
        .transition(.move(edge: .trailing))
        
    }
    
}

#Preview {
    return SideMenuView {}
}


