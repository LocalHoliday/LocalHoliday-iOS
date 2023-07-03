//
//  CountryDetailView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct CountryDetailView: View {
    @State private var playItems: [PlayItem] = []
    @State private var jobItems: [JobItem] = []
    @State private var selected: Int = 0
    @State private var isAPICalled: Bool = false
    let country: Country
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: proxy.size.width / 390 * 158)
                            .background(.black.opacity(0.4))
                            .background(
                                ImageView(id: 0, imageName: "\(country.title)_wide")
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: proxy.size.width / 390 * 158)
                                    .clipped()
                            )
                        
                        Text(country.title)
                            .font(.H1B)
                            .foregroundColor(.white)
                    }
                    .clipped()
                    
                    HorizontalSelectView(selected: $selected)
                        .frame(maxHeight: Size.XL)
                        .padding()
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: Size.M * 2) {
                            if selected == 0 {
                                ForEach(jobItems.indices, id: \.self) { index in
                                    NavigationLink {
                                        JobItemDetailView(jobItem: self.$jobItems[index])
                                    } label: {
                                        JobItemView(jobItem: self.$jobItems[index])
                                            .frame(maxHeight: 100)
                                    }
                                    .buttonStyle(.plain)
                                    Divider()
                                }
                            } else {
                                ForEach(playItems.indices, id: \.self) { index in
                                    NavigationLink {
                                        PlayItemDetailView(playItem: self.$playItems[index])
                                    } label: {
                                        PlayItemView(playItem: self.$playItems[index])
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
                
                BackButton(color: .white)
            }
        }
        .onAppear {
            if !isAPICalled {
                isAPICalled.toggle()
                playItems = PlayItem.defaultPlayItems
                jobItems = JobItem.defaultJobItems
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CountryDetailView(country: .default)
        }
    }
}
