//
//  PlayView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ImageView(id: 0, imageName: "SamplePlayImage", aspectRatio: 1)
            
            Text("가게 해변")
                .font(.B1M)
                .padding(.horizontal, Size.XXS)
            
            HStack {
                Image.Mappin
                    .frame(width: 12, height: 12)
                
                Text("전라남도 진도군 고군면 신비의바닷길 47")
                    .font(.B4R)
            }
            .padding(.horizontal, Size.XXS)
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
