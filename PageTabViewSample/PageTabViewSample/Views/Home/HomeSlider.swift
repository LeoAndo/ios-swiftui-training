//
//  ViewSlider.swift
//  PageTabViewSample
//
//  Created by LeoAndo on 2021/12/14.
//

import SwiftUI

struct HomeSlider: View {
    @EnvironmentObject var modelData: HomeModelData
    
    var body: some View {
        TabView {
            ForEach(modelData.users, id: \.self) { userInfo in
                NavigationLink {
                    UserInfoDetail(userInfo: userInfo)
                } label: {
                    UserInfoRow(name: userInfo.name, description: userInfo.description)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct HomeSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeSlider()
            .environmentObject(HomeModelData())
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
