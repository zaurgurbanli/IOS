//
//  FructusApp.swift
//  Fructus
//
//  Created by Zaur Gurbanli on 24.02.22.
//

import SwiftUI

@main
struct FructusApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                
            } else{
                ContentView()
            }
        }
    }
}
