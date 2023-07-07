//
//  LoginOrSignUpView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct LoginOrSignUpView: View {
    @EnvironmentObject var authData: AuthData
    @State private var phase: Int = 1
    var body: some View {
        if authData.loginInfo != nil {
            ContentView()
                .environmentObject(ModelData())
        } else {
            NavigationStack {
                if phase == 0 {
                    SplashView(phase: $phase)
                } else {
                    VStack(spacing: Size.Inner * 2) {
                        Spacer()
                        Image.LocalHoliday
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                        NavigationLink {
                            LoginView()
                        } label: {
                            RoundedRectangleView(text: "로그인")
                        }
                        
                        NavigationLink {
                            SignUpManageView()
                        } label: {
                            RoundedRectangleView(text: "회원가입")
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(Size.Outer)
                }
            }
        }
    }
}

struct LoginOrSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginOrSignUpView()
        }
    }
}
