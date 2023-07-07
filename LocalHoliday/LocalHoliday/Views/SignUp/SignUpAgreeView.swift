//
//  SignUpAgreeView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUpAgreeView: View {
    @State private var agree1: Bool = false
    @State private var agree2: Bool = false
    @Binding var phase: Int
    private var agreeAll: Bool {
        agree1 && agree2
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: Size.Inner * 2) {
                Text("회원가입을 위해\n약관에 동의해 주세요")
                    .font(.H2SB)
                
                Button {
                    if agreeAll {
                        agree1 = false
                        agree2 = false
                    } else {
                        agree1 = true
                        agree2 = true
                    }
                } label: {
                    HStack {
                        if agreeAll {
                            Image(systemName: "circle.fill")
                                .renderingMode(.template)
                                .foregroundColor(.Primary)
                        } else {
                            Image(systemName: "circle")
                                .renderingMode(.template)
                                .foregroundColor(.gray200)
                        }
                        
                        Text("전체 동의")
                            .font(.H3SB)
                            .foregroundColor(agreeAll ? .Primary : .black)
                    }
                }
                .buttonStyle(.plain)
                
                Divider()
                
                Button {
                    agree1.toggle()
                } label: {
                    HStack(alignment: .lastTextBaseline) {
                        if agree1 {
                            Image(systemName: "circle.fill")
                                .renderingMode(.template)
                                .foregroundColor(.Primary)
                        } else {
                            Image(systemName: "circle")
                                .renderingMode(.template)
                                .foregroundColor(.gray200)
                        }
                        
                        
                        Text("(필수)")
                        
                        NavigationLink {
                            WebView("https://swamp-open-7fc.notion.site/1-d48d06a02a0a4272a7b931d3aa27e138?pvs=4")
                        } label: {
                            Text("이용약관")
                                .underline()
                        }
                        .buttonStyle(.plain)

                        Text("에 동의합니다")
                    }
                    .font(.H4M)
                }
                .buttonStyle(.plain)
                
                Button {
                    agree2.toggle()
                } label: {
                    HStack(alignment: .lastTextBaseline) {
                        if agree2 {
                            Image(systemName: "circle.fill")
                                .renderingMode(.template)
                                .foregroundColor(.Primary)
                        } else {
                            Image(systemName: "circle")
                                .renderingMode(.template)
                                .foregroundColor(.gray200)
                        }
                        
                        Text("(필수)")
                        
                        NavigationLink {
                            WebView("https://swamp-open-7fc.notion.site/1-6a57f3cb9cad4dcdb7cbdf94ab850057?pvs=4")
                        } label: {
                            Text("개인정보 처리방침")
                                .underline()
                        }
                        .buttonStyle(.plain)

                        Text("에 동의합니다")
                    }
                    .font(.H4M)
                }
                .buttonStyle(.plain)
                
                NavigationLink {
                    WebView("https://swamp-open-7fc.notion.site/EULA-1-088a762e83954605aacb6aca002a7392?pvs=4")
                } label: {
                    Text("최종 사용자 사용권 계약(EULA)")
                        .font(.H4M)
                        .underline()
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                RoundedRectangleButton(text: agreeAll ? "다음" : "약관에 모두 동의해주세요.") {
                    phase += 1
                }
                .disabled(!agreeAll)
                .animation(.spring(), value: agreeAll)
            }
            .padding(Size.Inner)
        }
    }
}

struct SignUpAgreeView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAgreeView(phase: .constant(0))
    }
}
