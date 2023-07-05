//
//  PlayItem.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import Foundation

struct PlayItem: Hashable, Codable, Identifiable {
    var id: Int
    var imageURL: String?
    var title: String
    var location: String
    var description: String
    var isScrapped: Bool
    var isSelected: Bool = false
}

extension PlayItem {
    static let `default` = PlayItem(
        id: 0,
        title: "무주 덕유산 계곡 글램핑",
        location: "전라북도 남원시 금하정2길 20(금동)",
        description: "덕유산 계곡 글램핑 캠핑장은 계곡 쪽 사이트와 데크로 나뉘어 있다. 바로 옆이 덕유산 계곡인데 거기에 수영장까지 마련되어 있으니 하루 종일 물놀이만 해도 시간이 모자라다. 계곡으로 내려가는 길은 경사가 심하지 않고 수심이 깊지 않고 물살도 세지 않아 아이들도 안전하게 물놀이를 즐길 수 있다. 글램핑은 숙소 한 사이트에서 4인부터 최대 6인까지 즐길 수 있고 온돌바닥이라 겨울에도 따뜻하게 캠핑이 가능하다. 화장실, 샤워장, 개수대, 분리수거장, 탕비실이 마련되어 있다. 바닥에서 자는 것이 불편한 사람들은 침대방으로 예약 할 수도 있다. 캠핑장에서 차로 2분 거리에 덕유산 국립공원이 있어 청정 자연 속에서 진정한 휴가를 즐길 수 있는 곳이다. 걸어서 5분 정도 거리에 마트와 편의점이 있어서 필요한 물품을 사기에 편리하다. 계곡 바로 옆 평상을 대여하면 나무 그늘 아래서 유유자적 한가롭게 계곡 물소리 들으며 여유를 만끽할 수 있다.",
        isScrapped: false
    )
    static let defaultPlayItems: [PlayItem] = (0..<5).map { index in
        PlayItem(
            id: index,
            title: "무주 덕유산 계곡 글램핑_\(index)",
            location: "전라북도 남원시 금하정2길 20(금동)",
            description: "덕유산 계곡 글램핑 캠핑장은 계곡 쪽 사이트와 데크로 나뉘어 있다. 바로 옆이 덕유산 계곡인데 거기에 수영장까지 마련되어 있으니 하루 종일 물놀이만 해도 시간이 모자라다. 계곡으로 내려가는 길은 경사가 심하지 않고 수심이 깊지 않고 물살도 세지 않아 아이들도 안전하게 물놀이를 즐길 수 있다. 글램핑은 숙소 한 사이트에서 4인부터 최대 6인까지 즐길 수 있고 온돌바닥이라 겨울에도 따뜻하게 캠핑이 가능하다. 화장실, 샤워장, 개수대, 분리수거장, 탕비실이 마련되어 있다. 바닥에서 자는 것이 불편한 사람들은 침대방으로 예약 할 수도 있다. 캠핑장에서 차로 2분 거리에 덕유산 국립공원이 있어 청정 자연 속에서 진정한 휴가를 즐길 수 있는 곳이다. 걸어서 5분 정도 거리에 마트와 편의점이 있어서 필요한 물품을 사기에 편리하다. 계곡 바로 옆 평상을 대여하면 나무 그늘 아래서 유유자적 한가롭게 계곡 물소리 들으며 여유를 만끽할 수 있다.",
            isScrapped: false
        )
    }
}
