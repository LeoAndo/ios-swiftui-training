//
//  ContentView.swift
//  MyOkashi
//
//  Created by LeoAndo on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    
    // OkashiDataを参照する状態変数
    @StateObject var okashiDataList = OkashiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    // SafariViewの表示有無を管理する変数
    @State var showSafari = false
    
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    Task {
                        await okashiDataList.searchOkashi(keyword: inputText)
                        
                    }
                }
                .submitLabel(.search)  // キーボードの改行を検索に変更する
                .padding()
            
            // リスト表示する
            List(okashiDataList.okashiList) { okashi in
                Button(action: {
                    showSafari.toggle()
                }) {
                    // Listの表示内容を生成する
                    HStack {
                        AsyncImage(url: okashi.image) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                            
                        } placeholder: {
                            // 読み込み中はインジケーターを表示する
                            ProgressView()
                        }
                        Text(okashi.name)
                    }
                    
                }
                .sheet(isPresented: $showSafari, content: {
                    SafariView(url: okashi.link)
                        .edgesIgnoringSafeArea(.bottom) // 画面下部がセーフエリア外までいっぱいなるように指定
                })
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
