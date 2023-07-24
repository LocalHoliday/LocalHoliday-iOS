//
//  RecommendationDetailView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/05.
//

import SwiftUI

struct RecommendationDetailView: View {
    @Binding var recommend: Recommend
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 345)
                        .background(.black.opacity(0.4))
                        .background(
                            SquareImageView(imageURL: recommend.imageURL)
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        )
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        BackButton(color: .white)
                        
                        Text(recommend.title)
                            .font(.H2B)
                            .foregroundColor(.white)
                            .padding(Size.Inner)
                            .padding(.top, Size.Inner)
                        
                        Text(recommend.location)
                            .font(.B1M)
                            .foregroundColor(.white)
                            .padding(.horizontal, Size.Inner)
                        
//                        Text("3박 4일 예상 ??")
//                            .font(.B1M)
//                            .foregroundColor(.accentColor)
//                            .foregroundColor(.white)
//                            .padding(.horizontal, Size.Inner)
//                            .padding(.top, Size.S)
                    }
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: Size.Inner) {
                        if recommend.jobItem != .empty {
                            Group {
                                Text(recommend.title)
                                    .foregroundColor(.Primary)
                                + Text("에 딱 맞는 로컬 알바를 추천해드릴게요")
                                    .foregroundColor(.gray500)
                            }
                            .font(.H4B)
                            .padding(.vertical, Size.Inner)
                            
                            NavigationLink {
                                JobItemDetailView(jobItem: $recommend.jobItem)
                            } label: {
                                JobItemView(jobItem: $recommend.jobItem, isScrapButtonHidden: true)
                                    .frame(maxHeight: 176)
                            }
                            .buttonStyle(.plain)
                            Divider()
                        }
                        Group {
                            Text(recommend.title)
                                .foregroundColor(.Primary)
                            + Text("의 놀거리들을 추천해드릴게요")
                                .foregroundColor(.gray500)
                        }
                        .font(.H4B)
                        .padding(.vertical, Size.Inner)
                        
                        ForEach(recommend.playItems.indices, id: \.self) { index in
                            NavigationLink {
                                PlayItemDetailView(playItem: self.$recommend.playItems[index])
                            } label: {
                                PlayItemView(playItem: self.$recommend.playItems[index], isScrapButtonHidden: true)
                                    .frame(maxHeight: 176)
                            }
                            .buttonStyle(.plain)
                            Divider()
                        }
                    }
                }
                .padding(Size.Inner)
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct RecommendationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecommendationDetailView(recommend: .constant(.empty))
        }
    }
}
