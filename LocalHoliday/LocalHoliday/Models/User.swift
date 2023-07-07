//
//  User.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import Foundation

struct User: Hashable, Codable {
    var uuid: String
    var name: String
    var imageURL: String?
    var phoneNumber: String
    var nickname: String
    var address: String
    var email: String
}

extension User {
    static let `default` = User(uuid: "asdf", name: "이정민", phoneNumber: "01012341234", nickname: "블랑사랑에디", address: "서울시 동작구 상도로", email: "aaa@localholiday.com")
    static let empty = User(uuid: "", name: "", phoneNumber: "", nickname: "", address: "", email: "")
}
