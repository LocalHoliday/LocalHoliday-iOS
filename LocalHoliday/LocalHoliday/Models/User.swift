//
//  User.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import Foundation

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageURL: String?
    var phoneNumber: String
    var nickname: String
}

extension User {
    static let `default` = User(id: 0, name: "이정민", phoneNumber: "01012341234", nickname: "블랑사랑에디")
}
