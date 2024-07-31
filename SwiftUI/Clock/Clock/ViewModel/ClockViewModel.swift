//
//  ClockViewModel.swift
//  Clock
//
//  Created by Zaur Gurbanli on 26.07.24.
//

import SwiftUI
import Combine

class ClockViewModel: ObservableObject {
    @Published var second: Double = 0
    @Published var minute: Double = 0
    @Published var hour: Double = 0
    
    private var timer: Timer?
    
    init() {
        startClock()
    }
    
    private func startClock() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let components = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
            self.second = Double(components.second == 60 ? 0 : components.second ?? 0)
            self.minute = Double(components.minute ?? 0)
            self.hour = Double(components.hour ?? 0)
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
