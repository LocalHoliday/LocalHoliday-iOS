//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp6View: View {
    @EnvironmentObject var authData: AuthData
    @Binding var nickname: String
    @Binding var phase: Int
    @State var isVerified: Int = 0 // 0 : not yet, 1 : fail, 2 : pass, 3 : loading
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
                    isVerified = 3
                    authData.verifyNickname(nickname) { result in
                        if result {
                            isVerified = 2
                        } else {
                            isVerified = 1
                        }
                    } onError: {
                        isVerified = 5
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
            
            RoundedRectangleButton(text: "회원가입") {
                phase += 1
            }
            .disabled(nickname == "" || isVerified != 2)
        }
        .padding(Size.Inner)
    }
}

struct SignUp6View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp6View(nickname: .constant(""), phase: .constant(0))
    }
}
