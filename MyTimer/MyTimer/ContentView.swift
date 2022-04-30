//
//  ContentView.swift
//  MyTimer
//
//  Created by LeoAndo on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler : Timer?
    @State var count = 0
    @AppStorage("timer_value") var timerValue = 10
    @State var showAlert = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0) {
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    
                    HStack {
                        Button(action: {
                            startTimer()
                        }){
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        Button(action: {
                            guard let unwrapTimerHandler = timerHandler else { return }
                            if unwrapTimerHandler.isValid {
                                unwrapTimerHandler.invalidate()
                            }
                        }){
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .onAppear { // AndroidのonResumeのように画面表示時に呼ばれる
                print("onAppear")
                count = 0
            }
            .onDisappear {
                print("onDisappear")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()){
                        Text("秒数設定")
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("終了"), message: Text("タイマー終了時間です"), dismissButton: .default(Text("OK")))
            }
        }
        .navigationViewStyle(.stack) // iPadがiPhoneと同じ見た目になるように設定
    }
    
    func countDownTimer() {
        count += 1
        if timerValue - count <= 0 {
            timerHandler?.invalidate() // タイマー停止
            showAlert = true
        }
    }
    func startTimer() {
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid == true { // タイマーが実行中の場合
                return
            }
        }
        if timerValue - count <= 0 {
            count = 0
        }
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            print("timeInterval: \(timer.timeInterval)")
            // タイマー実行時に呼び出される.
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
