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
}

enum AuthenticationResult: Codable {
    case success
    case failure
}

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}
