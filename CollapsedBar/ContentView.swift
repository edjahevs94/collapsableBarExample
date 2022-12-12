//
//  ContentView.swift
//  CollapsedBar
//
//  Created by Edgard Vargas on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //to ignore and get safe area size...
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top
            
            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
