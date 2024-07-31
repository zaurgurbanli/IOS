//
//  SecondHandView.swift
//  Clock
//
//  Created by Zaur Gurbanli on 01.08.24.
//

import SwiftUI

struct SecondHandView: View {
    var second: Double
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(.orange)
                .frame(width: 2, height: geometry.size.width/2)
                .position(x:geometry.size.width/2, y:geometry.size.width/2/2 + 25)
                .rotationEffect(.degrees(second * 6) )
            
            Circle()
                .stroke(lineWidth: 2)
                .foregroundStyle(.orange)
                .frame(width: 10, height: 10)
                .overlay {
                    Circle()
                        .frame(width: 8, height: 8)
                }
                .position(x:geometry.size.width/2, y:geometry.size.width/2)
        }
    }
}

#Preview {
    SecondHandView(second: 0)
}
