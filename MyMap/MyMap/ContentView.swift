//
//  ContentView.swift
//  MyMap
//
//  Created by LeoAndo on 2022/04/28.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchKey = ""
    @State var dispMapType: MKMapType = .standard
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    dispSearchKey = inputText
                }
                .padding()
            
            // 奥から手前方向にレイアウトする
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: dispSearchKey, mapType: dispMapType) // "TOKYO SKYTREE"
                Button(action: {
                    switch(dispMapType) {
                    case .standard:
                        dispMapType = .satellite
                        break
                    case .satellite:
                        dispMapType = .hybrid
                        break
                    case .hybrid:
                        dispMapType = .satelliteFlyover
                        break
                    case .satelliteFlyover:
                        dispMapType = .hybridFlyover
                        break
                    case .hybridFlyover:
                        dispMapType = .mutedStandard
                        break
                    case .mutedStandard:
                        dispMapType = .standard
                        break
                    @unknown default:
                        dispMapType = .standard
                        break
                    }
                }) {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
