//
//  ContentView.swift
//  MyMusic
//
//  Created by LeoAndo on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            HStack {
                Button(action: {
                    soundPlayer.play(fileName: "cymbalSound")
                }){
                    Image("cymbal")
                }
                Button(action: {
                    soundPlayer.play(fileName: "guitarSound")
                }){
                    Image("guitar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
