//
//  LocalPlayDTO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

struct LocalPlayDTO: Codable {
    var foodDTOList: [FoodDTO]
    var houseDTOList: [HouseDTO]
    var tourDTOList: [TourDTO]
}
