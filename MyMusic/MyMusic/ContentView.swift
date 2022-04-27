//
//  ContentView.swift
//  MyMusic
//
//  Created by LeoAndo on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
