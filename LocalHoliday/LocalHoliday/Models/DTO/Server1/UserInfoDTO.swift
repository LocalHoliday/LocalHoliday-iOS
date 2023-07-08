//
//  UserInfoDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

struct UserInfoDTO: Codable {
    var id: String?
    var created: String?
    var email: String?
    var name: String?
    var nickname: String?
    var password: String?
    var phone: String?
    var photo: String?
    var place: String?
}
