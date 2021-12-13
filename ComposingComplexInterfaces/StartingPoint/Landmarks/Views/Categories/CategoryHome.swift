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
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
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
