//
//  BaseResponseDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

struct BaseResponseDTO: Codable {
    var code: Int?
    var message: String?
    var result: String?
}
