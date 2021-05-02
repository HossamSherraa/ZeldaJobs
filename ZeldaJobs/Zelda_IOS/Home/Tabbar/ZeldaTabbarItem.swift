//
//  ZeldaTabbarItem.swift
//  ZeldaJobs
//
//  Created by Hossam on 01/05/2021.
//



import SwiftUI
struct ZeldaTabbarItem : View {
    let imageName : String
    @State var isSelected : Bool = false
    var body: some View {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26, alignment: .center)
                .background(
                    
                    Capsule(style: .circular)
                        .frame( height: 3, alignment: .center)
                        .padding(6)
                        .offset( y: isSelected ? 17 : 22  )
                        .opacity(isSelected ? 1 :  0)
                    
                )
                .onTapGesture {
                    withAnimation(Animation.spring(response: 0.2, dampingFraction: 5.2, blendDuration: 4.0)) {
                        isSelected.toggle()
                    }
                }
            
        
        }
    }



struct ZeldaTabbarItem_Preview : PreviewProvider {
    static var previews: some View {
        ZeldaTabbarItem(imageName: "homeIcon")
            .frame(width: 200.0, height: 200.0)
    }
    
    
}
