//
//  ZeldaJobsApp.swift
//  ZeldaJobs
//
//  Created by Hossam on 20/04/2021.
//

import SwiftUI

@main
struct ZeldaJobsApp: App {
    var body: some Scene {
        WindowGroup {
            ZeldaTabbarAddItem()
        }
    }
}



struct X : PreviewProvider {
    static var previews: some View {
        ZeldaTabbarAddItem()
            .previewLayout(.fixed(width: 200.0, height: 200.0))
        
    }
    
    
}
