//
//  OffsetModifier.swift
//  CollapsedBar
//
//  Created by Edgard Vargas on 8/12/22.
//

import SwiftUI

//getting scrollview offset
struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(GeometryReader { proxy -> Color in
            // GETTING VALUE FOR COORDINATE SPACE CALLED SCROLL
            let minY = proxy.frame(in: .named("SCROLL")).minY
            //print(minY)
            DispatchQueue.main.async {
                self.offset = minY
            }
            
            return Color.clear
        }, alignment: .top)
    }
    
    
    
    
}
