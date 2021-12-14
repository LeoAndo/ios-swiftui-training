//
//  UserInfoDetail.swift
//  PageTabViewSample
//
//  Created by LeoAndo on 2021/12/14.
//

import SwiftUI

struct UserInfoDetail: View {
    var userInfo: UserInfo

    var body: some View {
        ScrollView {

            // Shape Image.
            Image(systemName: userInfo.imagename)
                .resizable()
                .frame(width: 200.0, height: 200.0)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 8)

            VStack(alignment: .leading) {
                Text(userInfo.username)
                    .font(.title)

                HStack {
                    Text(userInfo.name)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("description")
                    .font(.title2)
                Text(userInfo.description)
            }
            .padding()
        }
        .navigationTitle("User Info Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserInfoDetail_Previews: PreviewProvider {
    static let modelData = HomeModelData()
    static var previews: some View {
        UserInfoDetail(userInfo: modelData.users[0]).environmentObject(modelData)
    }
}
