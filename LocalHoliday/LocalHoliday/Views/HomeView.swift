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
                
                Text("다른 사람들의 로컬 홀리데이를 구경해보세요!")
                    .font(.H4SB)
                    .padding(.horizontal, Size.Inner)
                    .padding(.vertical, Size.Outer)
                
                Text("☀️ 이번 여름에 여행할 곳을 고민하고 있다면?!")
                    .font(.H4SB)
                    .padding(.horizontal, Size.Inner)
                    .padding(.vertical, Size.Outer)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
