//
//  HomeView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var playItems: [PlayItem] = []
    @State private var recommendsVO: RecommendItemsVO = RecommendItemsVO(recommends: [.empty, .empty])
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                HStack {
                    Spacer()
                    Image.LocalHoliday
                        .padding(.all, Size.Outer)
                    Spacer()
                }
                CountryGridView(countries: $modelData.countries)
                Group {
                    Text("🏖️ 이번 여름의 ")
                    + Text("로컬 홀리데이")
                        .foregroundColor(Color.Primary)
                    + Text("를 추천해드릴게요")
                }
                .font(.H4SB)
                .padding(.horizontal, Size.Inner)
                .padding(.vertical, Size.Outer)
                
                HStack(spacing: Size.Inner) {
                    NavigationLink {
                        RecommendationDetailView(recommend: $recommendsVO.recommends[0])
                    } label: {
                        PagingRecommendationView(recommend: $recommendsVO.recommends[0])
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink {
                        if recommendsVO.recommends.count < 2 {
                            EmptyView()
                        } else {
                            RecommendationDetailView(recommend: $recommendsVO.recommends[1])
                        }
                    } label: {
                        PagingRecommendationView(recommend: $recommendsVO.recommends[1])
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, Size.Inner)
                
                /*
                Text("📷 다른 사람들의 로컬 홀리데이를 구경해보세요!")
                    .font(.H4SB)
                    .padding(.horizontal, Size.Inner)
                    .padding(.vertical, Size.Outer)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Size.XL) {
                        ForEach(0..<5) { index in
                            NavigationLink {
                                RecipeDetailView(jobItems: .constant(JobItem.defaultJobItems), playItems: .constant(PlayItem.defaultPlayItems))
                            } label: {
                                BookView()
                                    .frame(width: UIScreen.main.bounds.width / 2)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, Size.Inner)
                }
                .frame(width: UIScreen.main.bounds.width)
                
                Text("☀️ 이번 여름에 여행할 곳을 고민하고 있다면?!")
                    .font(.H4SB)
                    .padding(.horizontal, Size.Inner)
                    .padding(.vertical, Size.Outer)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Size.S) {
                        ForEach(0..<5) { index in
                            NavigationLink {
                                PlayItemDetailView(playItem: .constant(.default))
                            } label: {
                                SquarePlayView()
                                    .frame(width: UIScreen.main.bounds.width / 11 * 5)
                            }
                            .buttonStyle(.plain)
                            
                        }
                    }
                    .padding(.horizontal, Size.Inner)
                }
                 */
            }
        }
        .onAppear {
            modelData.getRecommendItems { recommends in
                recommendsVO.recommends = recommends
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
                .environmentObject(ModelData())
        }
    }
}
