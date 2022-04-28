//
//  MapView.swift
//  MyMap
//
//  Created by LeoAndo on 2022/04/28.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let searchKey: String
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks, error) in
            print("placemarks: \(placemarks?.count)")
            print("error: \(error?.localizedDescription)")
            // リクエストの結果が存在すれば、1件目の位置情報から取り出す
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location {
                let targetCoordinate = location.coordinate
                print("targetCoordinate: \(targetCoordinate)")
            }
            
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "TOKYO SKYTREE")
    }
}
