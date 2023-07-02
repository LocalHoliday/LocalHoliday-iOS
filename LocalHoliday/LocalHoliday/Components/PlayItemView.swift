//
//  PlayItemView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct PlayItemView: View {
    @State private var isScrapped = false
    var body: some View {
        HStack(alignment: .center, spacing: Size.M * 2) {
            ImageView(id: 0, imageName: "경기")
            
            VStack(alignment: .leading, spacing: Size.XS) {
                HStack {
                    Text("덕유산 글램핑 즐기기")
                        .font(.B1M)
                        .padding(.vertical, Size.XS)
                    Spacer()
                }
                LocationComponent(location: "전라북도 남원시 금하정2길 20(금동)")
            }
            .frame(maxWidth: .infinity)
            
            ScrapButton(isScrapped: $isScrapped)
        }
    }
}

struct PlayItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlayItemView()
    }
}
