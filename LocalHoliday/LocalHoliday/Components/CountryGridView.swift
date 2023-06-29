//
//  CountryGridView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct CountryGridView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: Size.Inner) {
            ForEach(0..<2, id: \.self) { _ in
                IconView(image: Image.경기, title: "경기")
                IconView(image: Image.경기, title: "경기")
                IconView(image: Image.경기, title: "경기")
                IconView(image: Image.경기, title: "경기")
            }
            .padding(.horizontal, Size.Inner / 2)
        }
        .padding(.horizontal, Size.Inner / 2)
    }
}

struct CountryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CountryGridView()
    }
}
