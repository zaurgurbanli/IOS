//
//  LoginView.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 27.06.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Text("Podcast")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .padding(.leading, 10)
                    Spacer()
                }
                
                Text("Episodic series of digital audio.")
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .font(.system(size: 28))
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                InputField(input: $email, icon: "envelope", text: "E-mail address")
                    .padding(.bottom)
                InputField(input: $password, icon: "key", text: "Password", rotation: 45)

                CustomButton(text: "Login", color: Color.blue, destination: MainView())
                    .padding(.top, 30)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Forgot password?")
                        .font(.system(size: 14))
                        .padding(.vertical, 20)
                        .underline()
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                })
                
                CustomButton(text: "Login with Facebook", color: Color(hex: 0x2B5D95), destination: MainView())
                    .padding(.top, 35)
                CustomButton(text: "Register new account", color: Color(hex:0xFF334B), destination: MainView())
                    .padding(.top, 15)
                
                Divider()
                Spacer()
                
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .background(Color("background"))
            .scrollIndicators(.hidden)
            .ignoresSafeArea(.keyboard)
            .dismissKeyboardOnTap()
        }

    }
    
}

#Preview {
    LoginView()
}
