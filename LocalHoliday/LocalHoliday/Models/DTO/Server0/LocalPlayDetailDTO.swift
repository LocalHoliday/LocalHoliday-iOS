//
//  LocalPlayDetailDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation
struct LocalPlayDetailDTO: Codable {
    var uuid: String?
    var name: String?
    var addr: String?
    var lat: String?
    var lon: String?
    var info: String?
    var photo: String?
}
