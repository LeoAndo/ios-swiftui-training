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

struct TextPlaygroundView3: View {

    var body: some View {
        VStack(spacing: 16) {
            Text("largeTitle")
                .font(.largeTitle)
            Text("title")
                .font(.title)
            Text("title2")
                .font(.title2)
            Text("title3")
                .font(.title3)
            Text("headline")
                .font(.headline)
            Text("subheadline")
                .font(.subheadline)
            Text("body")
                .font(.body)
            Text("callout")
                .font(.callout)
            Text("footnote")
                .font(.footnote)
            Text("caption")
                .font(.caption)
//            Text("caption2")
//                .font(.caption2)
        }
    }
}

struct TextPlaygroundView4: View {

    var body: some View {
        VStack(spacing: 32) {
            Text("1: longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong")
                .font(.title)
                .lineLimit(1)
            
            Text("2: longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong")
                .font(.title)
                .lineLimit(2)
            
            Text("3: longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong")
                .font(.title)
                .lineLimit(nil)
        }
    }
}

struct TextPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextPlaygroundView()
            TextPlaygroundView2()
            TextPlaygroundView3()
            TextPlaygroundView4()
        }
    }
}
