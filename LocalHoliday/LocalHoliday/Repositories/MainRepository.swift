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
    func getPlayItemDetail(_ uuid: String, token: String?) -> AnyPublisher<BaseResponseLocalPlayDetailDTO, Error>
    
    func getRecommendItems(token: String?) -> AnyPublisher<BaseResponseListRecommendDTO, Error>
    
    func postReservation(_ reservation: ReservationDTO, token: String?) -> AnyPublisher<BaseResponseDTO, Error>
}

class BaseMainRepository: BaseRepository {
    let baseURL0: String = "http://15.165.241.113:8080/"
    let baseURL1: String = "http://15.165.241.113:8081/"
    var playURL: String {
        baseURL0 + "play"
    }
    var playDetailURL: String {
        baseURL0 + "play/detailview"
    }
    var recommendURL: String {
        baseURL0 + "recommend"
    }
    var reservationURL: String {
        baseURL0 + "reservation"
    }
}

final class DefaultMainRepository: BaseMainRepository, MainRepository {
    func getPlayItems(_ location: String, token: String?) -> AnyPublisher<BaseResponseLocalPlayDTO, Error> {
        return makeGetPublisher(withParameter: ["loc": location], url: playURL, token: token)
    }
    
    func getPlayItemDetail(_ uuid: String, token: String?) -> AnyPublisher<BaseResponseLocalPlayDetailDTO, Error> {
        return makeGetPublisher(withParameter: ["uuid": uuid], url: playDetailURL, token: token)
    }
    
    func getRecommendItems(token: String?) -> AnyPublisher<BaseResponseListRecommendDTO, Error> {
        return makeGetPublisher(withParameter: [:], url: recommendURL, token: token)
    }
    
    func postReservation(_ reservation: ReservationDTO, token: String?) -> AnyPublisher<BaseResponseDTO, Error> {
        return makePostPublisher(with: reservation, url: reservationURL, token: token)
    }
}
