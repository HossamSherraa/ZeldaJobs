//
//  ContentView.swift
//  ZeldaJobs
//
//  Created by Hossam on 20/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        fakeViewControllerJobs()
            .frame( height: 310, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
