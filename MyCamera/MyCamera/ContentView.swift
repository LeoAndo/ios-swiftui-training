//
//  ContentView.swift
//  MyCamera
//
//  Created by LeoAndo on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    @State var captureImage: UIImage? = nil
    @State var isShowSheet = false
    @State var isShowActivity = false
    @State var isPhotolibrary = false
    @State var isShowAction = false
    
    var body: some View {
        VStack {
            Spacer()
            // 撮影した写真があるとき
            if let unwrapCaptureImage = captureImage {
                Image(uiImage: unwrapCaptureImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit) // アスペクト比（縦横比）を維持して画面内に
            }
            Spacer()
            Button(action: {
                isShowAction = true
            }) {
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center) // 文字列をセンタリング指定
                    .background(.blue)
                    .foregroundColor(.white)  // 文字色を白色に指定
            }
            .padding()
            .sheet(isPresented: $isShowSheet) {
                if isPhotolibrary {
                    // PHPickerViewController（フォトライブラリー）を表示
                    PHPickerView(
                        isShowSheet: $isShowSheet,
                        captureImage: $captureImage)
                } else {
                    // UIImagePickerController（写真撮影）を表示
                    ImagePickerView(
                        isShowSheet: $isShowSheet,
                        captureImage: $captureImage)
                }
                
            }
            .actionSheet(isPresented: $isShowAction) {
                ActionSheet(title: Text("確認"),
                            message: Text("選択してください"),
                            buttons: [
                                .default(Text("カメラ"), action: {
                                    isPhotolibrary = false
                                    if UIImagePickerController.isSourceTypeAvailable(.camera){
                                        print("カメラは利用できます")
                                        isShowSheet = true
                                    } else {
                                        print("カメラは利用できません")
                                    }
                                }),
                                .default(Text("フォトライブラリー"), action: {
                                    isPhotolibrary = true
                                    isShowSheet = true
                                }),
                                .cancel(),
                            ])
            }
            
            // 「SNSに投稿する」ボタン
            Button(action: {
                // 撮影した写真があるときだけ
                // UIActivityViewController（シェア機能）を表示
                if let _ = captureImage {
                    isShowActivity = true
                }
            }) {
                Text("SNSに投稿する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
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

