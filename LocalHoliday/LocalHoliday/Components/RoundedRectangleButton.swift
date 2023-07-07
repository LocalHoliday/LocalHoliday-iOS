//
//  RoundedRectangleButton.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct RoundedRectangleButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0, green: 0.85, blue: 0.75), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.17, green: 0.75, blue: 0.68), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0, y: 0.5),
                endPoint: UnitPoint(x: 1, y: 0.5)
            )
            .frame(height: Size.XXXXL)
            .cornerRadius(Radius.Small)
            .overlay {
                Text(text)
                    .font(.H4B)
                    .foregroundColor(.white)
            }
        }
    }
}

struct RoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleButton(text: "test") {
            print("testtest")
        }
    }
}
