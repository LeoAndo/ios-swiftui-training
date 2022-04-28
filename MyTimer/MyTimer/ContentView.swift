//
//  ContentView.swift
//  MyTimer
//
//  Created by LeoAndo on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("タイマー画面")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()){
                        Text("秒数設定")
                    }
                }
            }
        }
        .navigationViewStyle(.stack) // iPadがiPhoneと同じ見た目になるように設定
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
