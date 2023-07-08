//
//  AuthRepository.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation
import Combine

protocol AuthRepository {
    func login(_ info: LoginCredentials) -> AnyPublisher<TokenResponseDTO, Error>
    func signUp(_ info: SignUpVO) -> AnyPublisher<TokenResponseDTO, Error>
}

class BaseAuthRepository {
    var cancellables = Set<AnyCancellable>()
    let baseURL: String = "http://15.165.241.113:8081/"
    var loginURL: String {
        baseURL + "signin"
    }
    var signUpURL: String {
        baseURL
    }
    private func makePostRequest(url: String, parameters: [String: Any]) -> URLRequest {
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        return request
    }
    
    /// T : 보낼 dto, R : 받을 dto
    func makePostPublisher<T: Encodable, R: Decodable>(with dtoRequest: T, url: String) -> AnyPublisher<R, Error> {
        print("parameter dictionary : \(dtoRequest.dictionary)")
        let request = makePostRequest(url: url, parameters: dtoRequest.dictionary)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw NetworkError.invalidResponse
                }
                return data
            }
            .decode(type: R.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

final class DefaultAuthRepository: BaseAuthRepository, AuthRepository {
    func login(_ info: LoginCredentials) -> AnyPublisher<TokenResponseDTO, Error> {
        return makePostPublisher(with: info.toDTO(), url: loginURL)
    }

    func signUp(_ info: SignUpVO) -> AnyPublisher<TokenResponseDTO, Error> {
        return makePostPublisher(with: info.toDTO(), url: signUpURL)
    }
}
