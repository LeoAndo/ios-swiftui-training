//
//  CategoryHome.swift
//  Landmarks
//
//  Created by LeoAndo on 2021/12/13.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var rotateIn3D = false
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .rotation3DEffect(.degrees(rotateIn3D ? 20 : -20), axis: (x: rotateIn3D ? -45.0 : -90.0, y: rotateIn3D ? -45.0 : -90.0, z: rotateIn3D ? -45.0 : -90.0))
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateIn3D.toggle()
                    }
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.landmarks)
                }
                .listRowInsets(EdgeInsets())
            }.navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
