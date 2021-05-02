//
//  BounceCirclesAnimation.swift
//  ZeldaJobs
//
//  Created by Hossam on 02/05/2021.
//

import SwiftUI
struct BounceAnimation : AnimatableModifier {
   
    
   var prc: CGFloat
   typealias AnimatableData = CGFloat
    let alpha : Double = 0.127
    let color : Color = Color.blue
    var animatableData: CGFloat {
        get {return prc}
        set {prc = newValue}
    }
    
     func body(content: Content) -> some View {
        
       return  ZStack{
            Circle()
                .fill(color)
                .opacity(alpha - alpha * Double(prc))
                .scaleEffect(1 + prc)
            Circle()
                .fill(color)
                .opacity(alpha)
                .scaleEffect(0.7 + (0.3 * prc))
            Circle()
                .fill(color)
                .opacity(alpha)
                .scaleEffect(0.4 + (0.3 * prc))
            Circle()
                .fill(color)
                .opacity(Double(prc) * alpha)
                .scaleEffect(0.2 + (0.2 * prc))
        }
    }
    
    
    
}

extension Color {
    static var randomColor : Color {
        let colors = [Color.red  , Color.blue , Color.yellow , Color.green , Color.secondary]
        return colors[Int.random(in: 0..<colors.count)]
    }
}
