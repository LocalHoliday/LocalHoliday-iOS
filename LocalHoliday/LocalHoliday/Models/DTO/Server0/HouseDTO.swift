//
//  HouseDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct HouseDTO: Codable {
    var uuid: String?
    var name: String?
    var addr: String?
    var lat: String?
    var lon: String?
    var photo: String?
}
