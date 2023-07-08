//
//  Country.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import Foundation

struct Country: Hashable, Identifiable, Codable {
    var id: Int
    var title: String
    var imageURL: String?
}

extension Country {
    static let `default` = Country(id: 0, title: "경기")
    static let defaultCountries: [Country] = [
        Country(id: 0, title: "경기"),
        Country(id: 1, title: "충청"),
        Country(id: 2, title: "경북"),
        Country(id: 3, title: "경남"),
        Country(id: 4, title: "전북"),
        Country(id: 5, title: "전남"),
        Country(id: 6, title: "강원"),
        Country(id: 7, title: "제주"),
    ]
}
