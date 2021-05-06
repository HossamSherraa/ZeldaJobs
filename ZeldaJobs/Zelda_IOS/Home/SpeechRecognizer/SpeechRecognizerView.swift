//
//  SpeechRecognizerView.swift
//  ZeldaJobs
//
//  Created by Hossam on 02/05/2021.
//

import SwiftUI
struct SpeechRecognizerView : View {
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color.white)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.141671792)), radius: 20)
            HStack(spacing:15){
                Image(systemName: "mic.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22, alignment: .center)
                
                HStack(spacing:6){
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 5, height: 7, alignment: .center)
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 5, height: 18, alignment: .center)
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 5, height: 11, alignment: .center)
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 5, height: 5, alignment: .center)
                }
                
                
            }
        }
    }
}


struct SpeechRecognizerView_Preview : PreviewProvider {
    static var previews: some View {
        SpeechRecognizerView()
            .frame(width: 125 , height: 57.0)
    }
}
