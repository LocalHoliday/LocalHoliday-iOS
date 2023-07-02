//
//  HomeView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                HStack {
                    Spacer()
                    Image.LocalHoliday
                        .padding(.all, Size.Outer)
                    Spacer()
                }
                CountryGridView()
                Group {
                    Text("🏖️ 이번 여름의 ")
                    + Text("로컬 홀리데이")
                        .foregroundColor(Color.accentColor)
                    + Text("를 추천해드릴게요")
                }
                .font(.H4SB)
                .padding(.horizontal, Size.Inner)
                .padding(.vertical, Size.Outer)
                
                HStack(spacing: Size.Inner) {
                    CardSlideView()
                    CardSlideView()
                }
                .padding(.horizontal, Size.Inner)
                
                Text("📷 다른 사람들의 로컬 홀리데이를 구경해보세요!")
                    .font(.H4SB)
                    .padding(.horizontal, Size.Inner)
                    .padding(.vertical, Size.Outer)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Size.XL) {
                        ForEach(0..<5) { index in
                            BookView()
                                .frame(width: UIScreen.main.bounds.width / 2)
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
                            PlayView()
                                .frame(width: UIScreen.main.bounds.width / 11 * 5)
                        }
                    }
                    .padding(.horizontal, Size.Inner)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
