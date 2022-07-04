//
//  ImagePlaygroundView.swift
//  SwiftUiOverview
//
//  Created by LeoAndo on 2022/07/04.
//

import SwiftUI

struct ImagePlaygroundView: View {
    var body: some View {
        Image(systemName: "brain.head.profile")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct ImagePlaygroundView2: View {
    // Imageのサイズが変化しないバージョン.
    var body: some View {
        Image(systemName: "brain.head.profile")
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct ImagePlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImagePlaygroundView()
            ImagePlaygroundView2()
        }
    }
}
