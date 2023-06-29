//
//  SquarePicture.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct SquarePicture: View {
    let image: Image
    let size: CGFloat?
    init(image: Image, size: CGFloat? = nil) {
        self.image = image
        self.size = size
    }
    var body: some View {
        image
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: size, height: size)
    }
}

struct SquarePicture_Previews: PreviewProvider {
    static var previews: some View {
        SquarePicture(image: Image("경기"))
    }
}
