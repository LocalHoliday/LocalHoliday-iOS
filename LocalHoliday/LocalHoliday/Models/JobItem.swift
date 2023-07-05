//
//  JobItem.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import Foundation

struct JobItem: Hashable, Codable, Identifiable {
    var id: Int
    var imageURL: String?
    var title: String
    var location: String
    var startTime: String
    var endTime: String
    var salary: Int?
    var manager: String
    var phoneNumber: String
    var isScrapped: Bool
    var isSelected: Bool
}

extension JobItem {
    static let `default` = JobItem(
        id: 0,
        title: "복숭아 봉지 씌우기",
        location: "전라북도 남원시 금하정2길 20(금동)",
        startTime: "2023.05.08",
        endTime: "2023.07.08",
        manager: "이정민",
        phoneNumber: "010-1111-1111",
        isScrapped: false,
        isSelected: false
    )
    
    static let defaultJobItems: [JobItem] = (0..<5).map { index in
        JobItem(
            id: index,
            title: "복숭아 봉지 씌우기_\(index)",
            location: "전라북도 남원시 금하정2길 20(금동)",
            startTime: "2023.05.08",
            endTime: "2023.07.08",
            manager: "이정민",
            phoneNumber: "010-1111-1111",
            isScrapped: false,
            isSelected: false
        )
    }
}

