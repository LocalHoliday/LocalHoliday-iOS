//
//  RecipeDetailView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/05.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var jobItems: [JobItem]
    @Binding var playItems: [PlayItem]
    var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack {
                            Image("SampleBookImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.size.width, height: proxy.size.height)
                                .blur(radius: Size.L)
                            
                            VStack {
                                ImageView(imageName: "SampleBookImage")
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: proxy.size.width / 3 * 2, maxHeight: proxy.size.height / 2)
                                    .cornerRadius(Radius.Small)
                                    .shadow(radius: Size.M)
                                
                                VStack(alignment: .leading, spacing: Size.M) {
                                    Text("두근 두근 전주에서의 로컬 홀리데이")
                                        .font(.H3SB)
                                        .padding(.top, Size.M)
                                    Text("블랑사랑에디")
                                        .font(.B2M)
                                        .padding(.bottom, Size.M)
                                    Text("여행지  전라남도 전주")
                                        .font(.B1R)
                                    Text("로컬 홀리데이 기간  2022.07.18 ~ 2022.07.23")
                                        .font(.B1R)
                                    Text("생일을 맞아서 친구들과 함께 로컬 홀리데이로 전주에 갔다. 블루베리 농장은 너무 힘들었지만 밥도 맛있고 한옥마을도 너무 예뻐서 완벽한 여행이였다!")
                                        .font(.B1R)
                                        .padding(.top, Size.XS)
                                }
                                .padding(.horizontal, Size.Outer)
                                .foregroundColor(.white)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: Size.Inner) {
                            Group {
                                Text("블랑사랑에디")
                                    .foregroundColor(.Primary)
                                + Text("님의 로컬 알바는")
                                    .foregroundColor(.gray500)
                            }
                            .font(.H4B)
                            .padding(.vertical, Size.Inner)
                            
                            ForEach(jobItems.indices, id: \.self) { index in
                                NavigationLink {
                                    JobItemDetailView(jobItem: self.$jobItems[index])
                                } label: {
                                    JobItemView(jobItem: self.$jobItems[index], isScrapButtonHidden: true)
                                        .frame(maxHeight: 176)
                                }
                                .buttonStyle(.plain)
                                Divider()
                            }
                            
                            Group {
                                Text("블랑사랑에디")
                                    .foregroundColor(.Primary)
                                + Text("님이 즐긴 관광지는")
                                    .foregroundColor(.gray500)
                            }
                            .font(.H4B)
                            .padding(.vertical, Size.Inner)
                            
                            ForEach(playItems.indices, id: \.self) { index in
                                NavigationLink {
                                    PlayItemDetailView(playItem: self.$playItems[index])
                                } label: {
                                    PlayItemView(playItem: self.$playItems[index], isScrapButtonHidden: true)
                                        .frame(maxHeight: 176)
                                }
                                .buttonStyle(.plain)
                                Divider()
                            }
                        }
                        .padding(.top, Size.M)
                        .padding(Size.Inner)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            BackButton(color: .white)
                .blendMode(.exclusion)
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecipeDetailView(jobItems: .constant(JobItem.defaultJobItems), playItems: .constant(PlayItem.defaultPlayItems))
        }
    }
}
