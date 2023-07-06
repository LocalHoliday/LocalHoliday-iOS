//
//  PlayItemDetailView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import SwiftUI

struct PlayItemDetailView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isAPICalled: Bool = false
    @Binding var playItem: PlayItem
    @State private var reviews: [Review] = []
    @State private var showingAlert = false
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ZStack(alignment: .topLeading) {
                    VStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: proxy.size.width / 498 * 256)
                            .background(
                                ImageView(id: 0, imageName: "SampleJobItemImage_wide")
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: proxy.size.width / 498 * 256)
                                    .clipped()
                            )
                            .clipped()
                        ScrollView {
                            VStack(alignment: .leading, spacing: Size.XS) {
                                Text(playItem.title)
                                    .font(.H2SB)
                                LocationComponent(location: playItem.location, font: .B2M)
                                    .padding(.vertical, Size.Inner)
                                
                                Text(playItem.description)
                                    .lineSpacing(Size.S)
                                    .multilineTextAlignment(.leading)
                                    .font(.B2M)
                                    .foregroundColor(.black)
                            }
                            .padding(Size.Inner)
                            
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: Size.XS)
                                .foregroundColor(.gray100)
                            
                            ReviewsView(reviews: $reviews, item: .constant(.playItem(playItem)))
                                .padding(Size.Inner)
                        }
                    }
                    BackButton(color: .white)
                }
                HStack {
                    ScrapButton(isScrapped: $playItem.isScrapped)
                    Button {
                        print("일정에 추가하기 버튼")
                        self.modelData.addPlayItem(self.playItem)
                        showingAlert.toggle()
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(maxWidth: proxy.size.width, maxHeight: 52)
                                .foregroundColor(.Primary)
                                .cornerRadius(Radius.Small)
                            Text("일정에 추가하기")
                                .font(.H4B)
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding(Size.M)
                .background(Color.white)
            }
        }
        .onAppear {
            if !isAPICalled {
                isAPICalled.toggle()
                reviews = Review.defaultReviews
            }
        }
        .alert("일정 추가 완료!", isPresented: $showingAlert, actions: {
            Button("OK!", role: .cancel){}
                .buttonStyle(.plain)
        })
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct PlayItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayItemDetailView(playItem: .constant(.default))
            .environmentObject(ModelData())
    }
}
