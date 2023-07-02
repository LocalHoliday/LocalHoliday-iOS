//
//  LocationComponent.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct LocationComponent: View {
    let location: String
    var font: Font = .B4R
    var body: some View {
        HStack {
            Image.Mappin
                .frame(width: 12, height: 12)
            
            Text(location)
                .font(font)
        }
    }
}

struct LocationComponent_Previews: PreviewProvider {
    static var previews: some View {
        LocationComponent(location: "전라남도 진도군 고군면 신비의바닷길 47")
    }
}
