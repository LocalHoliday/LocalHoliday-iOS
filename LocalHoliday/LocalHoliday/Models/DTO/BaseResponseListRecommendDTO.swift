//
//  BaseResponseListRecommendDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct BaseResponseListRecommendDTO: Codable {
    var code: Int?
    var message: String?
    var result: [RecommendDTO]?
}
