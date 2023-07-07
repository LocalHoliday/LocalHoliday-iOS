//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp6View: View {
    @Binding var nickname: String
    @Binding var phase: Int
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Outer * 2) {
            Text("닉네임을 입력해주세요")
                .font(.H2SB)
            
            HStack {
                VStack(alignment: .leading) {
                    TextField("닉네임", text: $nickname)
                        .font(.H4M)
                        .foregroundColor(nickname == "" ? .gray100 : .black)
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
            .disabled(nickname == "")
        }
        .padding(Size.Inner)
        .padding(.top, Size.Outer * 2)
    }
}

struct SignUp6View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp6View(nickname: .constant(""), phase: .constant(0))
    }
}
