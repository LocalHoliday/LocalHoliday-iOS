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
    func getInfo(token: String?) -> AnyPublisher<UserInfoDTO, Error>
    func verifyEmail(_ email: String, token: String?) -> AnyPublisher<ResultDTO, Error>
    func verifyNickname(_ nickname: String, token: String?) -> AnyPublisher<ResultDTO, Error>
}

class BaseAuthRepository: BaseRepository {
    let baseURL: String = "http://15.165.241.113:8081/"
    var loginURL: String {
        baseURL + "signin"
    }
    var signUpURL: String {
        baseURL
    }
    var getInfoURL: String {
        baseURL
    }
    var verifyEmailURL: String {
        baseURL + "verify/email"
    }
    var verifyNicknameURL: String {
        baseURL + "verify/nickname"
    }
}

final class DefaultAuthRepository: BaseAuthRepository, AuthRepository {
    func login(_ info: LoginCredentials, token: String?) -> AnyPublisher<TokenResponseDTO, Error> {
        return makePostPublisher(with: info.toDTO(), url: loginURL, token: token)
    }

    func signUp(_ info: SignUpVO, token: String?) -> AnyPublisher<TokenResponseDTO, Error> {
        return makePostPublisher(with: info.toDTO(), url: signUpURL, token: token)
    }
    
    func getInfo(token: String?) -> AnyPublisher<UserInfoDTO, Error> {
        return makeGetPublisher(withParameter: [:], url: getInfoURL, token: token)
    }
    
    func verifyEmail(_ email: String, token: String?) -> AnyPublisher<ResultDTO, Error> {
        return makeGetPublisher(withParameter: ["email": email], url: verifyEmailURL, token: token)
    }
    
    func verifyNickname(_ nickname: String, token: String?) -> AnyPublisher<ResultDTO, Error> {
        return makeGetPublisher(withParameter: ["nickname": nickname], url: verifyNicknameURL, token: token)
    }
}
