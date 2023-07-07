//
//  AuthData.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import Foundation

final class AuthData: ObservableObject {
    @Published var loginInfo: Info? = nil
    @Published var user: User = .default
}
