//
//  LoginCredentials.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct LoginCredentials: Codable {
    var email: String
    var password: String
    
    func toDTO() -> LoginCredentialsDTO {
        LoginCredentialsDTO(email: email, password: password)
    }
}
