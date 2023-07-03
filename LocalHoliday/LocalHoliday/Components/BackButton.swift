//
//  BackButton.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/04.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    var color: Color
    var padding: CGFloat = Size.M
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.backward")
                .renderingMode(.template)
                .foregroundColor(color)
                .contentShape(Rectangle())
                .padding(padding)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(color: .black)
    }
}
