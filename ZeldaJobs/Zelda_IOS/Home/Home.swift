//
//  ContentView.swift
//  ZeldaJobs
//
//  Created by Hossam on 20/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
        MapView()
            .colorScheme(.light)
            .opacity(1)
            .ignoresSafeArea()
            VStack(alignment:.center){
                HStack{
                    SpeechRecognizerView()
                        .frame(width: 125 , height: 57.0)
                    
                    
                        Text("iOS")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        
                        Text("Developer")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.gray)
                        
                    
                    Spacer()
                    
                }
                .offset(x: 30)
                
                HStack{
                    Spacer()
                    RangeView()
                        .offset(x: -30)
                }
                
                Spacer()
                fakeViewControllerJobs()
                    .frame( height: 310, alignment: .center)
                    .offset( y: -35)
                
                ZeldaTabbar()
               
            }
            
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
