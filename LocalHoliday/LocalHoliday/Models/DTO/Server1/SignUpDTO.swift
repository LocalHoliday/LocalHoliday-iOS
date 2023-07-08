//
//  SignUpDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct SignUpRequestDTO: Codable {
    var email: String?
    var password: String?
    var name: String?
    var phone: String?
    var nickname: String?
    var place: String?
}
