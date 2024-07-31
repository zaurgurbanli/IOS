//
//  ClockView.swift
//  Clock
//
//  Created by Zaur Gurbanli on 01.08.24.
//

import SwiftUI

struct ClockView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        GeometryReader { geometry in
            
            Circle().padding()
            
            ForEach(1..<13) { hour in
                Text("\(hour)")
                    .font(.title)
                    .foregroundStyle(.background)
                    .fontWeight(.medium)
                    .position(self.position(for: hour, in: geometry.size.width/2))
            }
            
            ForEach(0..<60) { tick in
                self.tickMark(at: tick, r: geometry.size.width/2)
                    .position(x:geometry.size.width/2, y:geometry.size.width/2)
            }
        }
    }
    
    func position(for hour: Int, in radius: CGFloat) -> CGPoint {
        let angle = Angle.degrees(Double(hour) / 12 * 360 - 90)
        let x = (radius - 60) * cos(CGFloat(angle.radians))
        let y = (radius - 60) * sin(CGFloat(angle.radians))
        return CGPoint(x: radius + x, y: radius + y)
    }
    func tickMark(at position: Int, r: CGFloat) -> some View {
        let angle = Angle.degrees(Double(position) / 60 * 360)
        let color = position % 5 == 0 ? colorScheme == .dark ? .black : .white : Color.gray
        
        return Rectangle()
            .fill(color)
            .frame(width: 3, height: 12)
            .offset(y: -Double(r - 30))
            .rotationEffect(angle)
    }
}

#Preview {
    ClockView()
}
