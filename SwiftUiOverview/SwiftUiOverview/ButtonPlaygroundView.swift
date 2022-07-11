//
//  ButtonPlaygroundView.swift
//  SwiftUiOverview
//
//  Created by LeoAndo on 2022/07/11.
//

import SwiftUI

struct ButtonPlaygroundView: View {
    var body: some View {
        Button(action: {
            print("taped button")
        }, label: {
            VStack(spacing: 16) {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("Select Photo")
                    .foregroundColor(.black)
            }
        }).frame(width: 150, height: 100).background(.red)
    }
}

struct ButtonPlaygroundView2: View {
    var body: some View {
        Button(action: {
            print("taped button")
        }, label: {
            VStack(spacing: 16) {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("Select Photo")
                    .foregroundColor(.black)
            }.frame(width: 150, height: 100).background(.red)
        })
    }
}

struct ButtonPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlaygroundView()
        ButtonPlaygroundView2()
    }
}


