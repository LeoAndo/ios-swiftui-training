//
//  ContentView.swift
//  MyJyanken
//
//  Created by LeoAndo on 2022/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("gu")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("グー")
            Button(action: {
                print("クリックされました")
            }) {
                Text("ジャンケンをする")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
