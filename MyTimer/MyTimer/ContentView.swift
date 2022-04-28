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
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0) {
                    Text("残り10秒")
                        .font(.largeTitle)
                    
                    HStack {
                        Button(action: {
                        }){
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        Button(action: {
                        }){
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
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
