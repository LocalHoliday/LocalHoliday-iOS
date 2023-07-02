//
//  CountryDetailView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct CountryDetailView: View {
    @State private var selected: Int = 0
    let country: String
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
                                ImageView(id: 0, imageName: "\(country)_wide")
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: proxy.size.width / 390 * 158)
                                    .clipped()
                            )
                        
                        Text("경기")
                            .font(.H1B)
                            .foregroundColor(.white)
                    }
                    .clipped()
                    
                    HorizontalSelectView(selected: $selected)
                        .frame(maxHeight: Size.XL)
                        .padding()
                    
                    ScrollView {
                        VStack(spacing: Size.M * 2) {
                            ForEach(0..<5, id: \.self) { _ in
                                JobItemView()
                                    .frame(maxHeight: 100)
                                Divider()
                            }
                        }
                        .padding(Size.Inner)
                    }
                }
                Button {
                    print("Button Tapped")
                } label: {
                    Image(systemName: "arrow.backward")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                        .padding()
                }
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: "경기")
    }
}
