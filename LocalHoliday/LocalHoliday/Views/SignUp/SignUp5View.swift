//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp5View: View {
    @Binding var password: String
    @State var conformPassword: String = ""
    @Binding var phase: Int
    var isConformed: Bool {
        password == conformPassword && conformPassword != ""
    }
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Outer) {
            Text("비밀번호를 입력해주세요")
                .font(.H2SB)
            
            VStack {
                SecureField("비밀번호", text: $password)
                    .font(.H4M)
                Divider()
            }
            
            VStack {
                SecureField("비밀번호 확인", text: $conformPassword)
                    .font(.H4M)
                Divider()
            }
            
            if isConformed {
                Text("비밀번호가 일치합니다 ✅")
                    .font(.H4M)
                    .foregroundColor(.gray300)
            }
            
            Spacer()
            
            RoundedRectangleButton(text: "다음") {
                phase += 1
            }
            .disabled(!isConformed)
        }
        .padding(Size.Inner)
    }
}

struct SignUp5View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp5View(password: .constant(""), phase: .constant(0))
    }
}
