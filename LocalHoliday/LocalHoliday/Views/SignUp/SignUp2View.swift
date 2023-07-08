//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp2View: View {
    @Binding var phoneNumber: String
    @Binding var phase: Int
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Outer * 2) {
            Text("전화번호를 입력해주세요")
                .font(.H2SB)
            
            VStack {
                TextField("010 1234 1234", text: $phoneNumber)
                    .font(.H4M)
                    .keyboardType(.numberPad)
                Divider()
            }
            
            Spacer()
            
            RoundedRectangleButton(text: "다음") {
                phase += 1
            }
            .disabled(phoneNumber == "")
        }
        .padding(Size.Inner)
    }
}

struct SignUp2View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp2View(phoneNumber: .constant(""), phase: .constant(0))
    }
}
