//
//  MapView.swift
//  ZeldaJobs
//
//  Created by Hossam on 02/05/2021.
//

import SwiftUI
import MapKit
final class MapView : MKMapView {
    
}

extension MapView : UIViewRepresentable {
    func makeUIView(context: Context) -> MapView {
        MapView()
    }
    
    func updateUIView(_ uiView: MapView, context: Context) {

    }
    
    typealias UIViewType = MapView
    
    
}
