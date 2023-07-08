//
//  AuthData.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import Foundation

final class AuthData: ObservableObject {
    @Published var loginInfo: TokenResponseDTO? = nil
    @Published var user: User = .default
    
    private let repository = DefaultAuthRepository()
}

extension AuthData {
    // MARK: - UseCase
    public func login(
        _ info: LoginCredentials,
        onNext: ((TokenResponseDTO) -> Void)? = nil,
        onError: (() -> Void)? = nil,
        onCompletion: (() -> Void)? = nil
    ) {
        self.repository.login(info, token: self.loginInfo?.token)
            .prefix(1)
            .sink { completion in
                defer {
                    onCompletion?()
                }
                switch completion {
                case .failure(let error):
                    print("error! : \(error.localizedDescription)")
                    onError?()
                case.finished:
                    print("finished!")
                }
            } receiveValue: { result in
                print("result : \(result)")
                onNext?(result)
            }
            .store(in: &self.repository.cancellables)
    }
    
    public func signUp(
        _ info: SignUpVO,
        onNext: ((TokenResponseDTO) -> Void)? = nil,
        onError: (() -> Void)? = nil,
        onCompletion: (() -> Void)? = nil
    ) {
        self.repository.signUp(info, token: self.loginInfo?.token)
            .prefix(1)
            .sink { completion in
                defer {
                    onCompletion?()
                }
                switch completion {
                case .failure(let error):
                    print("error! : \(error.localizedDescription)")
                    onError?()
                case.finished:
                    print("finished!")
                }
            } receiveValue: { result in
                print("result : \(result)")
                onNext?(result)
            }
            .store(in: &self.repository.cancellables)
    }
}
