//
//  Review.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import Foundation

struct Review: Hashable, Codable, Identifiable {
    var id: Int
    var imageURL: String?
    var user: OtherUser
    var body: String
    var date: String
    struct OtherUser: Hashable, Codable {
        var id: Int
        var nickname: String
        var imageURL: String?
    }
}

extension Review {
    static let `default` = Review(
        id: 0,
        user: OtherUser(id: 0, nickname: "에디사랑블랑"),
        body: "너무 재밌었지만 그만큼 너무 힘들었다. 하지만 시골에서 자연을 즐기며 혼자만의 시간을 즐긴것은 매우 좋은 경험이였던 것 같다!",
        date: "2023.06.30"
    )
    
    static let defaultReviews: [Review] = (0..<5).map { index in
        Review(
            id: index,
            user: OtherUser(id: index, nickname: "에디사랑블랑_\(index)"),
            body: "너무 재밌었지만 그만큼 너무 힘들었다. 하지만 시골에서 자연을 즐기며 혼자만의 시간을 즐긴것은 매우 좋은 경험이였던 것 같다!",
            date: "2023.06.30"
        )
    }
}
