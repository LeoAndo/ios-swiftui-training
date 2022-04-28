//
//  ContentView.swift
//  MyMap
//
//  Created by LeoAndo on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchKey = ""
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    dispSearchKey = inputText
                }
                .padding()
            MapView(searchKey: dispSearchKey) // "TOKYO SKYTREE"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
