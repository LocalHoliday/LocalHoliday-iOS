//
//  MainRepository.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation
import Combine

protocol MainRepository {
    func getPlayItems(_ location: String, token: String?) -> AnyPublisher<BaseResponseLocalPlayDTO, Error>
}

class BaseMainRepository: BaseRepository {
    let baseURL: String = "http://15.165.241.113:8080/"
    var playURL: String {
        baseURL + "play"
    }
}

final class DefaultMainRepository: BaseMainRepository, MainRepository {
    func getPlayItems(_ location: String, token: String?) -> AnyPublisher<BaseResponseLocalPlayDTO, Error> {
        return makeGetPublisher(withParameter: ["loc": location], url: playURL, token: token)
    }
}
