//
//  RecommendItemsVO.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/09.
//

import Foundation

struct RecommendItemsVO: Codable {
    var recommends: [Recommend]
    
    static func fromDTO(_ dto: BaseResponseListRecommendDTO) -> Self {
        Self(recommends: dto.result?.map { dto in
            Recommend.fromDTO(dto)
        } ?? [])
    }
}

struct Recommend: Codable {
    var id: String
    var title: String
    var location: String
    var imageURL: String?
    var jobItem: JobItem
    var playItems: [PlayItem]
    
    static func fromDTO(_ dto: RecommendDTO) -> Self {
        Recommend(
            id: dto.uuid ?? "",
            title: dto.title ?? "",
            location: dto.location ?? "",
            imageURL: dto.photo,
            jobItem: JobItem.fromDTO(dto.jobDTO),
            playItems: dto.tourList.map { tourDTO in
                PlayItem.fromDTO(tourDTO)
            }
        )
    }
    
    static let empty = Recommend(id: "", title: "", location: "", jobItem: .default, playItems: [])
}
