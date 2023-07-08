//
//  SignUpVO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct SignUpVO: Hashable, Codable {
    var email: String
    var password: String
    var name: String
    var phoneNumber: String
    var nickname: String
    var address: String
    
    func toDTO() -> SignUpRequestDTO {
        SignUpRequestDTO(
            email: email,
            password: password,
            name: name,
            phone: phoneNumber,
            nickname: nickname,
            place: address
        )
    }
}

extension SignUpVO {
    static let empty = SignUpVO(email: "", password: "", name: "", phoneNumber: "", nickname: "", address: "")
}
