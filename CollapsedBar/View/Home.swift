//
//  Home.swift
//  CollapsedBar
//
//  Created by Edgard Vargas on 8/12/22.
//

import SwiftUI

struct Home: View {
    
    // Max height
    let maxHeight = UIScreen.main.bounds.height / 2.1
    var topEdge: CGFloat
    
    // offset
    @State var offset: CGFloat = 0
 
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                // Top Nav View...
                GeometryReader { proxy in
                    
                    TopBar( offset: $offset)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        //sticky effect ..
                        .frame(height: getHeaderHeight(), alignment: .bottom)
                        .background(
                            Color(.blue)
                                    ,in: CustomCorner(corner: [.bottomRight], radius: getCornerRadius())
                        )
                       .overlay(
        
                            //top nav view
                            HStack(spacing: 15) {
                                Button{
                                    
                                } label: {
                                    Image(systemName: "xmark").font(.body.bold())
                                }
                                
                                Image("local")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .opacity(topBarTitleOpacity())
                                
                                Text("iPedro")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(topBarTitleOpacity())
                                
                                Spacer()
                                
                                Button{
                                    
                                } label: {
                                    Image(systemName: "line.3.horizontal.decrease").font(.body.bold())
                                }
                            }
                            // max height...
                                .padding(.horizontal)
                                .frame(height: 80)
                                .foregroundColor(.white)
                                .padding(.top, topEdge)
                            , alignment: .top
                        )
                    
                }.frame(height: maxHeight)
                // fixing at top...
                    .offset(y: -offset)
                    //sample messages
                    .zIndex(1)
                VStack(spacing: 15) {
                    ForEach(allMessages) {message in
                        // card view
                        MessageCardView(message: message)
                    }
                }.padding()
                    .zIndex(0)
                
            }.modifier(OffsetModifier(offset: $offset))
        }
        //setting coordinate space...
        .coordinateSpace(name: "SCROLL")
    }
    func getHeaderHeight() -> CGFloat {
        //print(offset)
        //80 is the constant top nav bar height....
        // since we included top safe area so we also need to include
        //that too...
        
        let topHeight = maxHeight + offset
        print("offset: \(offset)")
        print("maxHeight: \(maxHeight)")
        print("topHeight: \(topHeight)")
        print("topEdge: \(topEdge)")
        // si el topHeight es mayor al espacio 80 + topEdge(vale 60),
        // se mandara el valor de topHeight el cual varia conforme se
        // scrollea para que se modifique la altura de la cabecera
        // pero si topHeight deja de ser mayor, se le mandara el valor
        // constante de 80 + topEdge, para que de este modo la cabecera
        // se detenga a esa altura y de un efecto de formacion de barra.
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func getCornerRadius() -> CGFloat {
        
        let progress = -offset / (maxHeight - (80 + topEdge))
        
        let value = 1 - progress
        
        let radius = value * 50
        
        return offset < 0 ? radius : 50
    }
    
    func topBarTitleOpacity() -> CGFloat {
        //to start after the main content vanished...
        // we need to eliminate 70 from offset
        //to get the starter
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        print("secondary opacity progress: \(progress)")
        // para que comienze desde antes es necesario 
        return progress
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar: View {
    
    //var topEdge: CGFloat
    @Binding var offset: CGFloat
    //var maxHeight: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
         
            Image("local").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            Text("iPedro").font(.largeTitle.bold())
            
            Text("Pedro Lopez is a farmer that made his own food then he teach us how to cook great meals and another interesting things with natural stuff")
                .fontWeight(.semibold)
                .foregroundColor(Color.white.opacity(0.8))
            
        }.padding()
        .padding(.bottom)
        .opacity(getOpacity())
        
    }
    // Calculation opacity...
    func getOpacity() -> CGFloat{
        // some random amount of time to visible scroll...
        let progress = -offset / 70
        
        let opacity = 1 - progress
        print("primary opacity progress: \(opacity)")
        //si el offset es mayor a 0 regresara 1 para que no haya opacidad alguna
        //pero si el offset es menor retorna un valor menor 0 que se ira
        //restando de 1 para crear un efecto de desvanecimiento
        return offset < 0 ? opacity : 1
    }
}

struct MessageCardView: View {
    
    var message: Message
    
    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .fill(message.tintColor)
                .frame(width: 50, height: 50)
                .opacity(0.8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(message.userName).fontWeight(.bold)
                Text(message.message).foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}
