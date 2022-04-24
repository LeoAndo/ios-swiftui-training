//
//  ContentView.swift
//  MyJyanken
//
//  Created by LeoAndo on 2022/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var answerNumber = 0
    var body: some View {
        VStack {
            if answerNumber == 0 {
                // 初期状態
                Text("これからジャンケンをします")
            } else if answerNumber == 1 {
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("グー")
            } else if answerNumber == 2 {
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("チョキ")
            } else {
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("パー")
            }
            Button(action: {
                var randomNumber = 0
                repeat {
                    randomNumber = Int.random(in: 1...3)
                } while answerNumber == randomNumber
                
                print("クリックされました: \(randomNumber)")
                answerNumber = randomNumber
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