//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp4View: View {
    @EnvironmentObject var authData: AuthData
    @Binding var email: String
    @Binding var phase: Int
    @State var isVerified: Int = 0 // 0 : not yet, 1 : fail, 2 : pass, 3 : loading
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Outer * 2) {
            Text("이메일을 입력해주세요")
                .font(.H2SB)
            
            HStack {
                VStack(alignment: .leading) {
                    TextField("aaa@\("")localholiday.com", text: $email) // 하이퍼링크 해제 트릭
                        .font(.H4M)
                        .foregroundColor(email == "" ? .gray100 : .black)
                        .keyboardType(.emailAddress)
                    Divider()
                }
                
                Button {
                    print("중복확인")
                    isVerified = 3
                    authData.verifyEmail(email) { result in
                        if result {
                            isVerified = 2
                        } else {
                            isVerified = 1
                        }
                    }
                } label: {
                    RoundedRectangle(cornerRadius: Radius.Small)
                        .stroke(Color.Primary)
                        .frame(width: Size.XXXXXL, height: Size.XXL)
                        .overlay {
                            var message: String {
                                switch isVerified {
                                case 0: return "중복확인"
                                case 1: return "중복됨🚫"
                                case 2: return "확인✅"
                                case 3: return "로딩중.."
                                default: return "에러"
                                }
                            }
                            Text(message)
                                .font(.B3R)
                        }
                }
                .contentShape(Rectangle())
                .buttonStyle(.plain)
                .disabled(isVerified == 3)
            }
            
            Spacer()
            
            RoundedRectangleButton(text: "다음") {
                phase += 1
            }
            .disabled(email == "" || isVerified != 2)
        }
        .padding(Size.Inner)
    }
}

struct SignUp4View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp4View(email: .constant(""), phase: .constant(0))
    }
}
