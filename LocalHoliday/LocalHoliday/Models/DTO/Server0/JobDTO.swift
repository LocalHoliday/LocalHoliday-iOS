//
//  JobDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct JobDTO: Codable {
    var uuid: String?
    var name: String?
    var addr: String?
    var startTime: String?
    var endTime: String?
    var pay: String?
    var photo: String?
}
