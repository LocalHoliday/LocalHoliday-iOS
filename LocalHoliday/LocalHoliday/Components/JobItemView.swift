//
//  JobItemView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct JobItemView: View {
    @State private var isScrapped = false
    var body: some View {
        HStack(alignment: .center, spacing: Size.M * 2) {
            ImageView(id: 0, imageName: "경기")
            
            VStack(alignment: .leading, spacing: Size.XS) {
                Text("복숭아 봉지씌우기")
                    .font(.B1M)
                    .padding(.vertical, Size.XS)
                LocationComponent(location: "전라북도 남원시 금하정2길 20(금동)")
                Text("작업기간 ")
                    .font(.B3M)
                    .foregroundColor(.black)
                + Text("2023.05.08 ~ 2023.07.08")
                    .font(.B3M)
                    .foregroundColor(.gray500)
                
                Text("급여 ")
                    .font(.B3M)
                    .foregroundColor(.black)
                + Text("협의")
                    .font(.B3M)
                    .foregroundColor(.tertiary)
            }
            
            ScrapButton(isScrapped: $isScrapped)
        }
    }
}

struct JobItemView_Previews: PreviewProvider {
    static var previews: some View {
        JobItemView()
    }
}
