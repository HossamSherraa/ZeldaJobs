//
//  ZeldaTabbarAddItem.swift
//  ZeldaJobs
//
//  Created by Hossam on 01/05/2021.
//

import SwiftUI
struct ZeldaTabbarAddItem : View {
    @State var prc : CGFloat = 0
    var body: some View{
        Color.gray
            .modifier(BounceAnimation(prc: prc))
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 3.8).repeatForever(autoreverses: false)) {
                    prc = 1
                }
            })
           
    }
}





struct ZeldaPreview : PreviewProvider {
    static var previews: some View {
        ZeldaTabbarAddItem()
    }
}
