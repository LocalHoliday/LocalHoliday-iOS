//
//  RecommendDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct RecommendDTO: Codable {
    var uuid: String?
    var title: String?
    var location: String?
    var photo: String?
    var jobDTO: JobDTO?
    var tourList: [TourDTO]
}
