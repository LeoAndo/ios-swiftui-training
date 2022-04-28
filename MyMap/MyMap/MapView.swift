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
            print("placemarks: \(String(describing: placemarks))")
            print("error: \(String(describing: error?.localizedDescription))")
            // リクエストの結果が存在すれば、1件目の位置情報から取り出す
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location {
                let targetCoordinate = location.coordinate
                print("targetCoordinate: \(targetCoordinate)")
                
                // pinの生成
                let pin = MKPointAnnotation()
                pin.coordinate = targetCoordinate
                pin.title = searchKey
                uiView.addAnnotation(pin)
                // 緯度経度を中心に半径200mの範囲を表示
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate, latitudinalMeters: 200.0, longitudinalMeters: 200.0)
            }
            
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "TOKYO SKYTREE")
    }
}
