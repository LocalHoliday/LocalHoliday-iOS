//
//  HorizontalSelectView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct HorizontalSelectView: View {
    @Binding var selected: Int
    var body: some View {
        HStack {
            Button {
                selected = 0
            } label: {
                Text("로컬 알바")
                    .font(.H5SB)
                    .foregroundColor(selected == 0 ? .Primary : .gray300)
                    .frame(maxWidth: .infinity)
            }
            .contentShape(Rectangle())

            Divider()

            Button {
                selected = 1
            } label: {
                Text("로컬 놀거리")
                    .font(.H5SB)
                    .foregroundColor(selected == 1 ? .Primary : .gray300)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct HorizontalSelectView_Previews: PreviewProvider {
    @State static var selected: Int = 0
    static var previews: some View {
        NavigationStack {
            HorizontalSelectView(selected: $selected)
        }
    }
}
