//
//  RangeView.swift
//  ZeldaJobs
//
//  Created by Hossam on 02/05/2021.
//

import SwiftUI
struct RangeView : View {
    var body: some View {
        ZStack {
          
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.white)
                
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.141671792)), radius: 20)
            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.up")
                        .font(Font.system(size: 18, weight: .medium, design: .rounded))
                        .accentColor(.black)
                })
                Spacer()
                Text("0.2KM")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    
                Spacer()
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.down")
                        .font(Font.system(size: 18, weight: .medium, design: .rounded))
                        .accentColor(.black)
                })
            }
            .padding(.vertical, 13)
        }
        .frame(width: 65, height: 145, alignment: .center)
    }
}

struct RangeView_Preview : PreviewProvider {
    
    static var previews: some View {
        RangeView()
    }
    
}
