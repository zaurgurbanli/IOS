//
//  HandView.swift
//  Clock
//
//  Created by Zaur Gurbanli on 01.08.24.
//

import SwiftUI

struct HandView: View {
    var length: CGFloat
    var padding: CGFloat
    var rotation: Double
    var height: CGFloat { length - padding - 30}
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 5)
                .foregroundStyle(.background)
                .frame(width: 12, height: 12)
            VStack(spacing: 0){
                Rectangle()
                    .fill(.background)
                    .frame(width: 8, height: height)
                    .clipShape(.capsule)
                    .position(x:length, y:height/2 + padding)
                Rectangle()
                    .fill(.background)
                    .frame(width: 4, height: 50)
                    .clipShape(.capsule)
                    .position(x:length, y:-(50)/2)
            }
            .rotationEffect(Angle(degrees: rotation))
        }
    }
}

#Preview {
    HandView(length: 100, padding: 20, rotation: 0)
}
