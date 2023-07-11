//
//  BaseRepository.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation
import Combine
import UIKit

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
    
    private func makeDeleteRequest(url: String, parameters: [String: Any], token: String?) -> URLRequest {
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "DELETE"
        
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = jsonData
        return request
    }
    
    private func makeMultipartRequest(url: String, image: UIImage?, queries: [String: Any]?, token: String?) -> URLRequest {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        // Multipart Form Data 생성
        let boundary = UUID().uuidString
        let contentType = "multipart/form-data; boundary=\(boundary)"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        
        // 첫 번째 키: 파일 데이터
        if let imageData = image?.jpegData(compressionQuality: 0.01) {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(imageData)
            body.append("\r\n".data(using: .utf8)!)
        }
        
        queries?.forEach({ key, value in
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
        })
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        // URLRequest에 본문(body) 설정
        request.httpBody = body
        
        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
    
    /// T : 보낼 dto, R : 받을 dto
    func makePostPublisher<T: Encodable, R: Decodable>(with dtoRequest: T, url: String, token: String?) -> AnyPublisher<R, Error> {
        print("parameter dictionary : \(dtoRequest.dictionary)")
        let request = makePostRequest(url: url, parameters: dtoRequest.dictionary, token: token)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse(-999)
                }
                let code = httpResponse.statusCode
                if code != 200 {
                    print("http error! errorCode : \(code), response : \(response), data: \(String(data: data, encoding: .utf8))")
                    throw NetworkError.invalidResponse(httpResponse.statusCode)
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
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse(-999)
                }
                let code = httpResponse.statusCode
                if code != 200 {
                    throw NetworkError.invalidResponse(httpResponse.statusCode)
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
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse(-999)
                }
                let code = httpResponse.statusCode
                if code != 200 {
                    throw NetworkError.invalidResponse(httpResponse.statusCode)
                }
                return data
            }
            .decode(type: R.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func makeMultipartPublisher<R: Decodable>(withImage uiImage: UIImage?, url: String, queries: [String:Any], token: String?) -> AnyPublisher<R, Error> {
        let request = makeMultipartRequest(url: url, image: uiImage, queries: queries, token: token)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse(-999)
                }
                let code = httpResponse.statusCode
                if code != 200 {
                    throw NetworkError.invalidResponse(httpResponse.statusCode)
                }
                return data
            }
            .decode(type: R.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func makeDeletePublisher<R: Decodable>(withParameter dictionary: [String: Any], url: String, token: String?) -> AnyPublisher<R, Error> {
        print("parameter dictionary : \(dictionary)")
        let request = makeDeleteRequest(url: url, parameters: dictionary, token: token)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse(-999)
                }
                let code = httpResponse.statusCode
                if code != 200 {
                    print("http error! errorCode : \(code), response : \(response), data: \(String(data: data, encoding: .utf8))")
                    throw NetworkError.invalidResponse(httpResponse.statusCode)
                }
                return data
            }
            .decode(type: R.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
