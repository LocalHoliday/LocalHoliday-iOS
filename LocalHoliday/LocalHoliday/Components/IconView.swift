//
//  IconView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct IconView: View {
    let image: Image
    let title: String
    var body: some View {
        VStack(alignment: .center) {
            SquarePicture(image: image)
                .shadow(radius: Size.Shadow)
            Text(title)
                .font(.B2R)
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(image: Image.경기, title: "경기")
    }
}
