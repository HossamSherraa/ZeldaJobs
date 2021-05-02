//
//  ZeldaTabbar.swift
//  ZeldaJobs
//
//  Created by Hossam on 01/05/2021.
//

import SwiftUI
struct ZeldaTabbar : View {
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1))
        RoundedRectangle(cornerRadius: 25 , style: .continuous)
            .fill(Color.white)
            .frame( height: 72, alignment: .center)
            .padding(.horizontal , 60)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05221009866)), radius: 24)
            
            HStack{
                Image("homeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26, alignment: .center)
               
                Image("userIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28, alignment: .center)
                
            }
            
        }
        .ignoresSafeArea()
            
    }
}

struct ZeldaTabbar_Preview : PreviewProvider {
    static var previews: some View {
        ZeldaTabbar()
    }
    
    
}
