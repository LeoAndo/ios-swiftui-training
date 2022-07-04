//
//  LazyVStackPlaygroundView.swift
//  SwiftUiOverview
//
//  Created by LeoAndo on 2022/07/04.
//

import SwiftUI

struct LazyVStackPlaygroundView: View {
    var body: some View {
        // 画面表示時のメモリ使用量: 10MB
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 1000) { _ in
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                }
            }
        }
    }
}

struct VStackPlaygroundView: View {
    var body: some View {
        // データ1000件: 画面表示時のメモリ使用量: 42MB
        ScrollView {
            VStack {
                ForEach(0 ..< 1000) { _ in
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                }
            }
        }
    }
}

struct LazyVStackPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LazyVStackPlaygroundView()
            VStackPlaygroundView()
        }
    }
}
