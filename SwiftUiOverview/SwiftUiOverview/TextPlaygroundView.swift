//
//  TextPlaygroundView.swift
//  SwiftUiOverview
//
//  Created by LeoAndo on 2022/07/04.
//

import SwiftUI

struct TextPlaygroundView: View {
    var body: some View {
        // セーフエリア内
        Text("Hello, World!")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.green)
    }
}

struct TextPlaygroundView2: View {
    var body: some View {
        // セーフエリアまで表示領域を広げるケース
        Text("Hello, World!")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.green)
            .ignoresSafeArea()
    }
}

struct TextPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        TextPlaygroundView()
        TextPlaygroundView2()
    }
}
