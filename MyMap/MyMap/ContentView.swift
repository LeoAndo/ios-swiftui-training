//
//  ContentView.swift
//  MyMap
//
//  Created by LeoAndo on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView(searchKey: "TOKYO SKYTREE")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
