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
    var isValid: Bool {
        isValidEmail(email: email)
    }
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
                .disabled(!isValid || isVerified == 3)
            }
            
            Spacer()
            
            RoundedRectangleButton(text: isVerified != 2 ? "중복 확인을 눌러주세요" : "다음") {
                phase += 1
            }
            .disabled(isVerified != 2)
        }
        .padding(Size.Inner)
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

}

struct SignUp4View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp4View(email: .constant(""), phase: .constant(0))
    }
}
