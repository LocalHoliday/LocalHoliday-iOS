//
//  BaseRepository.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation
import Combine

class BaseRepository {
    var cancellables = Set<AnyCancellable>()
    
    private func makePostRequest(url: String, parameters: [String: Any], token: String?) -> URLRequest {
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = jsonData
        return request
    }
    
    private func makeGetRequest(url: String, parameters: [String: Any]?, token: String?) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        if let parameters {
            request.url?.append(queryItems: parameters.map({ (key, value) in
                URLQueryItem(name: key, value: "\(value)")
            }))
        }
        return request
    }
    
    /// T : 보낼 dto, R : 받을 dto
    func makePostPublisher<T: Encodable, R: Decodable>(with dtoRequest: T, url: String, token: String?) -> AnyPublisher<R, Error> {
        print("parameter dictionary : \(dtoRequest.dictionary)")
        let request = makePostRequest(url: url, parameters: dtoRequest.dictionary, token: token)
        
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
    
    /// T : 보낼 dto, R : 받을 dto
    func makeGetPublisher<T: Encodable, R: Decodable>(withDTO dtoRequest: T, url: String, token: String?) -> AnyPublisher<R, Error> {
        print("parameter dictionary : \(dtoRequest.dictionary)")
        let request = makeGetRequest(url: url, parameters: dtoRequest.dictionary, token: token)
        
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
    
    func makeGetPublisher<R: Decodable>(withParameter dictionary: [String: Any], url: String, token: String?) -> AnyPublisher<R, Error> {
        print("parameter dictionary : \(dictionary)")
        let request = makeGetRequest(url: url, parameters: dictionary, token: token)
        
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
