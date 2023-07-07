//
//  MyPageScrapView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/07.
//

import SwiftUI

struct MyPageScrapView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selected: Int = 0
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HorizontalSelectView(selected: $selected)
                    .frame(maxHeight: Size.XL)
                    .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: Size.M * 2) {
                        if selected == 0 {
                            ForEach(modelData.scrappedJobItems.indices, id: \.self) { index in
                                NavigationLink {
                                    JobItemDetailView(jobItem: self.$modelData.scrappedJobItems[index])
                                } label: {
                                    JobItemView(jobItem: self.$modelData.scrappedJobItems[index])
                                        .frame(maxHeight: 100)
                                }
                                .buttonStyle(.plain)
                                Divider()
                            }
                        } else {
                            ForEach(modelData.scrappedPlayItems.indices, id: \.self) { index in
                                NavigationLink {
                                    PlayItemDetailView(playItem: self.$modelData.scrappedPlayItems[index])
                                } label: {
                                    PlayItemView(playItem: self.$modelData.scrappedPlayItems[index])
                                        .frame(maxHeight: 100)
                                }
                                .buttonStyle(.plain)
                                Divider()
                            }
                        }
                    }
                    .padding(Size.Inner)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationTitle("스크랩")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(color: .black, padding: 0)
            }
        }
    }
}

struct MyPageScrapView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPageScrapView()
                .environmentObject(ModelData(scrappedJobItems: JobItem.defaultJobItems, scrappedPlayItems: PlayItem.defaultPlayItems))
        }
    }
}
