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
    // シェア画面の（sheet）の開閉状態を管理
    @State var isShowActivity = false
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
            
            // 「SNSに投稿する」ボタン
            Button(action: {
                // ボタンをタップしたときのアクション
                // 撮影した写真があるときだけ
                // UIActivityViewController（シェア機能）を表示
                if let _ = captureImage {
                    isShowActivity = true
                }
            }) {
                Text("SNSに投稿する")
                    // 横幅いっぱい
                    .frame(maxWidth: .infinity)
                    // 高さ50ポイント指定
                    .frame(height: 50)
                    // 文字列をセンタリング指定
                    .multilineTextAlignment(.center)
                    // 背景を青色に指定
                    .background(Color.blue)
                    // 文字色を白色に指定
                    .foregroundColor(Color.white)
            } // 「SNSに投稿する」ボタンここまで
            // 上下左右に余白を追加
            .padding()
            // sheetを表示
            // isPresentedで指定した状態変数がtrueのとき実行
            .sheet(isPresented: $isShowActivity) {
                // UIActivityViewController（シェア機能）を表示
                ActivityView(shareItems: [captureImage!])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
