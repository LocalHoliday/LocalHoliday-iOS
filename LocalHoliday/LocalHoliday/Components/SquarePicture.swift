//
//  SquarePicture.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct SquarePicture: View {
    let image: Image
    init(image: Image) {
        self.image = image
    }
    var body: some View {
        image
    }
}

struct SquarePicture_Previews: PreviewProvider {
    static var previews: some View {
        SquarePicture(image: Image("경기"))
    }
}
