//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp1View: View {
    @Binding var name: String
    @Binding var phase: Int
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: Size.Outer * 2) {
                Text("이름을 입력해주세요")
                    .font(.H2SB)
                
                VStack {
                    TextField("이름", text: $name)
                        .font(.H4M)
                    Divider()
                }
                
                Spacer()
                
                RoundedRectangleButton(text: "다음") {
                    phase += 1
                }
                .disabled(name == "")
            }
            .padding(Size.Inner)
        }
    }
}

struct SignUp1View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp1View(name: .constant(""), phase: .constant(0))
    }
}
