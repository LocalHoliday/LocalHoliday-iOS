//
//  ScrapButton.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct ScrapButton: View {
    @Binding var isScrapped: Bool
    var body: some View {
        Button {
            isScrapped.toggle()
        } label: {
            if !isScrapped {
                Image(systemName: "star")
                    .renderingMode(.template)
                    .foregroundColor(.gray200)
                    .frame(width: Size.L, height: Size.L)
                    .padding()
            } else {
                Image(systemName: "star.fill")
                    .renderingMode(.original)
                    .frame(width: Size.L, height: Size.L)
                    .padding()
                    
            }
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle())
    }
}

struct ScrapButton_Previews: PreviewProvider {
    static var previews: some View {
        ScrapButton(isScrapped: .constant(false))
    }
}
