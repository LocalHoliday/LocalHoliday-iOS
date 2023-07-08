//
//  AuthRepository.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation
import Combine

protocol AuthRepository {
    func login(_ info: LoginCredentials, token: String?) -> AnyPublisher<TokenResponseDTO, Error>
    func signUp(_ info: SignUpVO, token: String?) -> AnyPublisher<TokenResponseDTO, Error>
}

class BaseAuthRepository: BaseRepository {
    let baseURL: String = "http://15.165.241.113:8081/"
    var loginURL: String {
        baseURL + "signin"
    }
    var signUpURL: String {
        baseURL
    }
    
}

final class DefaultAuthRepository: BaseAuthRepository, AuthRepository {
    func login(_ info: LoginCredentials, token: String?) -> AnyPublisher<TokenResponseDTO, Error> {
        return makePostPublisher(with: info.toDTO(), url: loginURL, token: token)
    }

    func signUp(_ info: SignUpVO, token: String?) -> AnyPublisher<TokenResponseDTO, Error> {
        return makePostPublisher(with: info.toDTO(), url: signUpURL, token: token)
    }
}
