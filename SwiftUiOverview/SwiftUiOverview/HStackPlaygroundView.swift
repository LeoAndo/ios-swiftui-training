//
//  HStackPlaygroundView.swift
//  SwiftUiOverview
//
//  Created by LeoAndo on 2022/07/04.
//

import SwiftUI

struct HStackPlaygroundView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Text("First")
            Image(systemName: "brain.head.profile")
            Text("SecondText")
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
        .background(.green)
    }
}

struct HStackPlaygroundView2: View {
    // layoutPriorityのテスト
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Text("First")
            Image(systemName: "brain.head.profile")
            Text("SecondText").layoutPriority(1)
        }
        .frame(maxWidth: 170)
        .padding()
        .background(.green)
    }
}

struct HStackPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        HStackPlaygroundView()
        HStackPlaygroundView2()
    }
}

