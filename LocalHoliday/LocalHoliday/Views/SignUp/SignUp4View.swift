//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp4View: View {
    @Binding var email: String
    @Binding var phase: Int
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Outer * 2) {
            Text("이메일을 입력해주세요")
                .font(.H2SB)
            
            HStack {
                VStack(alignment: .leading) {
                    TextField("aaa@\("")localholiday.com", text: $email) // 하이퍼링크 해제 트릭
                        .font(.H4M)
                        .foregroundColor(email == "" ? .gray100 : .black)
                    Divider()
                }
                
                Button {
                    print("중복확인")
                } label: {
                    RoundedRectangle(cornerRadius: Radius.Small)
                        .stroke(Color.Primary)
                        .frame(width: Size.XXXXXL, height: Size.XXL)
                        .overlay {
                            Text("중복 확인")
                                .font(.B3R)
                        }
                }
                .contentShape(Rectangle())
                .buttonStyle(.plain)
            }
            
            Spacer()
            
            RoundedRectangleButton(text: "다음") {
                phase += 1
            }
            .disabled(email == "")
        }
        .padding(Size.Inner)
        .padding(.top, Size.Outer * 2)
    }
}

struct SignUp4View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp4View(email: .constant(""), phase: .constant(0))
    }
}
