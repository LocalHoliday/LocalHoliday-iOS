//
//  AuthRepository.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation
import Combine

protocol AuthRepository {
    func login(_ info: LoginCredentials) -> AnyPublisher<Info, Error>
}

class BaseAuthRepository {
    var cancellables = Set<AnyCancellable>()
    let baseURL: String = "http://15.165.241.113:8081/"
    var loginURL: String {
        baseURL + "signin"
    }
    func makePostRequest(url: String, parameters: [String: Any]) -> URLRequest {
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        return request
    }
}

final class DefaultAuthRepository: BaseAuthRepository, AuthRepository {
    func login(_ info: LoginCredentials) -> AnyPublisher<Info, Error> {
        let request = makePostRequest(url: loginURL, parameters: info.dictionary)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw NetworkError.invalidResponse
                }
                return data
            }
            .decode(type: Info.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum NetworkError: Error {
    case invalidURL
    case encodingError
    case invalidResponse
}
