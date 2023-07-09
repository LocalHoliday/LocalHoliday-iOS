//
//  PlayItemView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct PlayItemView: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var playItem: PlayItem
    var isScrapButtonHidden = false
    var body: some View {
        HStack(alignment: .center, spacing: Size.M * 2) {
            RoundedSquareImageView(imageURL: playItem.imageURL)
            
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
                    .onChange(of: playItem.isScrapped) { newValue in
                        if newValue {
                            modelData.scrapPlayItem(playItem)
                        } else {
                            modelData.unscrapPlayItem(playItem)
                        }
                    }
            }
        }
    }
}

struct PlayItemViewWithoutBinding: View {
    var playItem: PlayItem
    var body: some View {
        HStack(alignment: .center, spacing: Size.M * 2) {
            SquareImageView(imageURL: playItem.imageURL)
            
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
        }
    }
}

struct PlayItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = PlayItem.default
        PlayItemView(playItem: .constant(item))
            .environmentObject(ModelData())
    }
}
