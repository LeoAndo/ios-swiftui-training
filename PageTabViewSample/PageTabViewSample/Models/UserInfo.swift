//
//  UserInfo.swift
//  PageTabViewSample
//
//  Created by LeoAndo on 2021/12/14.
//

import Foundation

struct UserInfo: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var description: String
    var imagename: String
}
