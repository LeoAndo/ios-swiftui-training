//
//  ContentView.swift
//  MyJyanken
//
//  Created by LeoAndo on 2022/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("gu")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
