//
//  SideMenuView.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 20){
                UnevenRoundedRectangle(bottomLeadingRadius: 40)
                    .fill(Color(hex: 0x060D15))
                    .frame(width: UIScreen.main.bounds.size.width * 0.85, height: UIScreen.main.bounds.size.height * 0.3)
                    .overlay {
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
                                Text("Hello,\nZaur!")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 24))
                                Spacer()
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "bell")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(15)
                                        .foregroundStyle(.white)
                                })
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(15)
                                        .foregroundStyle(.white)
                                })
                            }
                            .padding(.trailing, 15)
                            .padding(.leading, 30)
                            
                            Spacer()
                        }
                    }
                
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, bottomLeading: 0, bottomTrailing: 0, topTrailing: 0)
                )
                .fill(Color(hex: 0x060D15))
                .frame(width: UIScreen.main.bounds.size.width * 0.85)
                
            }
            
            
        }
        .transition(.move(edge: .trailing))
        .background(.clear)
        
        .onTapGesture {
            presentSideMenu = false
        }
        .ignoresSafeArea()
        
    }
    
}

#Preview {
    @State var present: Bool = false
    return SideMenuView(presentSideMenu: $present)
}


