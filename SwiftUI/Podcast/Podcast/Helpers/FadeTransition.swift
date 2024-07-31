//
//  FadeTransition.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 21.07.24.
//

import SwiftUI

extension AnyTransition {
    static var fade: AnyTransition {
        .asymmetric(insertion: .modifier(
            active: ExpandModifier(scale: 0),
            identity: ExpandModifier(scale: 1)
            
        ), removal: .modifier(
            active: ExpandModifier(scale: 0, isRemoval: true),
            identity: ExpandModifier(scale: 1, isRemoval: true)
            
        ))
        
    }
}

struct ExpandModifier: ViewModifier {
    var scale: CGFloat
    var isRemoval = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(x: scale, y: isRemoval ? scale : 1, anchor: .topTrailing)
            .opacity(isRemoval ? scale : 1)
            .clipped()
    }
}
