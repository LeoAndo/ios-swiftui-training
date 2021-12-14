//
//  UserInfoRow.swift
//  PageTabViewSample
//
//  Created by LeoAndo on 2021/12/14.
//

import SwiftUI

struct UserInfoRow: View {
    var name: String
    var description: String
    @State private var rotateIn3D = false
    
    var body: some View {

        VStack(alignment: .leading) {
            Text(name)
                .font(.title)
                .foregroundColor(.primary)
                .padding(20)
                .rotation3DEffect(.degrees(rotateIn3D ? 20 : -20), axis: (x: rotateIn3D ? -45.0 : -90.0, y: rotateIn3D ? -45.0 : -90.0, z: rotateIn3D ? -45.0 : -90.0))
                                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                                    .onAppear {
                                        rotateIn3D.toggle()
                                    }
            Text(description)
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct UserInfoRow_Previews: PreviewProvider {
    static let modelData = HomeModelData()
    static var previews: some View {
        UserInfoRow(name: modelData.users[0].username, description: modelData.users[0].description)
    }
}
