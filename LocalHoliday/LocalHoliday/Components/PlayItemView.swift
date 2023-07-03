//
//  PlayItemView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct PlayItemView: View {
    @Binding var playItem: PlayItem
    var isScrapButtonHidden = false
    var body: some View {
        HStack(alignment: .center, spacing: Size.M * 2) {
            ImageView(id: 0, imageName: "경기")
            
            VStack(alignment: .leading, spacing: Size.XS) {
                HStack {
                    Text(playItem.title)
                        .font(.B1M)
                        .padding(.vertical, Size.XS)
                    Spacer()
                }
                LocationComponent(location: playItem.location)
            }
            .frame(maxWidth: .infinity)
            
            if !isScrapButtonHidden {
                ScrapButton(isScrapped: $playItem.isScrapped)
            }
        }
    }
}

struct PlayItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = PlayItem.default
        PlayItemView(playItem: .constant(item))
    }
}
