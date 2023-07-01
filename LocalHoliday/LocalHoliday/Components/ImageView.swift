//
//  ImageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct ImageView: View {
    var id: Int
    var imageName: String
    var aspectRatio: CGFloat = 1
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
            .tag(id)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(id: 9, imageName: "Star")
    }
}
