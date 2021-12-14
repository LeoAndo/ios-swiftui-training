//
//  ContentView.swift
//  PageTabViewSample
//
//  Created by LeoAndo on 2021/12/14.
//

import SwiftUI

struct ContentView: View {
    @State private var anim = false
    @State private var blurRadius = 100.0
    @State private var scaleAnim = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HomeSlider()
                        .frame(height: 400.0)
                        .listRowInsets(EdgeInsets())
                        .background(.purple.opacity(0.3))
                        .blur(radius: blurRadius)
                        .environmentObject(HomeModelData())
                }
                .navigationBarTitle("PageTabViewSample")
                
                Text("Blur radius: " + String(format: "%.1f", blurRadius))
                    .font(.title)
                    .foregroundColor(.red.opacity(0.8))
                    .rotationEffect(scaleAnim ? .degrees(360) : .degrees(0))
                    .animation(Animation.easeInOut(duration: 6.0))
                    .onAppear {
                        print("leo onAppear")
                        if(!scaleAnim) { // WORK AROUND: only first animation
                            scaleAnim.toggle()
                        }
                    }
                
                Slider(value: $blurRadius, in: 0...100).padding(20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HomeModelData())
    }
}
