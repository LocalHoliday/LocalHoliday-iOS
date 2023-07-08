//
//  BaseResponseLocalPlayDetailDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

struct BaseResponseLocalPlayDetailDTO: Codable {
    var code: Int?
    var message: String?
    var result: LocalPlayDetailDTO?
}
