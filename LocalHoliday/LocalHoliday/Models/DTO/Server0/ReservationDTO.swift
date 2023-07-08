//
//  ReservationDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct ReservationDTO: Codable {
    var start: String?
    var end: String?
    var location: String?
    var uuid: [String]?
}
