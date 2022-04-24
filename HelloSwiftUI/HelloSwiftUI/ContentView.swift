//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by LeoAndo on 2022/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, Swift!")
                .font(.largeTitle)
                .padding()
            // 標準フォントを使わない方法
            Text("Hello, Swift!")
                .font(.system(size: 60))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
