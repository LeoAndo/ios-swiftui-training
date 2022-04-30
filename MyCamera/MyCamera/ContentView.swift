//
//  ContentView.swift
//  MyCamera
//
//  Created by LeoAndo on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    @State var isShowSheet = false
    @State var captureImage: UIImage? =  nil
    var body: some View {
        VStack {
            Spacer()
            if let unwrapCaptureImage = captureImage {
                Image(uiImage: unwrapCaptureImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button(action: {
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    print("カメラは利用できる")
                    isShowSheet = true
                } else {
                    print("カメラは利用できない")
                }
            }) {
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center) // 文字列をセンタリング
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .padding()
            .sheet(isPresented: $isShowSheet){
                ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
