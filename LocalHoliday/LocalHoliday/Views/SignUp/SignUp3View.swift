//
//  SignUp1View.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUp3View: View {
    @Binding var address: String
    @Binding var phase: Int
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Outer * 2) {
            Text("사는 지역을 입력해주세요")
                .font(.H2SB)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(address == "" ? "도로명 주소로 찾기를 터치해주세요" : address)
                        .font(.H4M)
                        .foregroundColor(address == "" ? .gray100 : .black)
                    Divider()
                }
                
                NavigationLink {
                    PostalCodeWebView(delegate: WebViewDelegate(address: $address, isLoading: .constant(false)))
                        .navigationBarBackButtonHidden()
                } label: {
                    RoundedRectangle(cornerRadius: Radius.Small)
                        .stroke(Color.Primary)
                        .frame(width: Size.XXXXXL, height: Size.XXL)
                        .overlay {
                            Text("도로명 주소로 찾기")
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
            .disabled(address == "")
        }
        .padding(Size.Inner)
    }
}

struct SignUp3View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUp3View(address: .constant(""), phase: .constant(0))
        }
    }
}
