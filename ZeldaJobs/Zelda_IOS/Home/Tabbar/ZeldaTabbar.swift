//
//  ZeldaTabbar.swift
//  ZeldaJobs
//
//  Created by Hossam on 01/05/2021.
//

import SwiftUI
struct ZeldaTabbar : View {
    @State var width : CGFloat = 0
    var body: some View {
        ZStack{
            EmptyRectangelView()
            
        Rectangle()
            .fill(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25 , style: .continuous))
            
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05221009866)), radius: 24)
            .frame( width: min(width * 0.8, 280), height: 72, alignment: .center)
            .overlay(
            HStack{
                ZeldaTabbarItem(imageName: "homeIcon")
                Spacer()
                ZeldaTabbarAddItem()
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Text("+")
                                .font(Font.system(size: 28, weight: .semibold, design: .rounded))
                                .offset( y: -1))
                Spacer()
                ZeldaTabbarItem(imageName: "userIcon")
            }
            .padding(.horizontal, width * 0.15)
            )
        }
        .frame( height: 72)
            
            .onPreferenceChange(ZeldaTabbarPreferenceKey.self, perform: { value in
                width = value.first!
            })
        
        }
    
         
    
    }


struct ZeldaTabbar_Preview : PreviewProvider {
    static var previews: some View {
        ZeldaTabbar()
    }
    
    
}



struct ZeldaTabbarPreferenceKey : PreferenceKey {
    static var defaultValue: [CGFloat] = []
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf:nextValue())
    }
    
    typealias Value = [CGFloat]
    
    
    
}


struct EmptyRectangelView : View {
    var body: some View {
        Color.clear
            .background(
                GeometryReader{proxy in
                    Color.clear
                        .preference(key: ZeldaTabbarPreferenceKey.self, value: [proxy.size.width] )
                }
            )
            
    }
}
