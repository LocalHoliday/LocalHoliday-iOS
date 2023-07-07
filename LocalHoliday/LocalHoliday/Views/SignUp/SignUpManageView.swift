//
//  SignUpManageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUpManageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var phase: Int = 0
    @State private var user: User = User.empty
    @State private var password: String = ""
    var body: some View {
        VStack {
            switch phase {
            case 0: SplashView(phase: $phase)
            case 1: OnboardingView(phase: $phase)
            case 2: SignUpAgreeView(phase: $phase)
            case 3: SignUp1View(name: $user.name, phase: $phase)
            case 4: SignUp2View(phoneNumber: $user.phoneNumber, phase: $phase)
            case 5: SignUp3View(address: $user.address, phase: $phase)
            case 6: SignUp4View(email: $user.email, phase: $phase)
            case 7: SignUp5View(password: $password, phase: $phase)
            case 8: SignUp6View(nickname: $user.nickname, phase: $phase)
            case 9: SignUpFinishView(phase: $phase)
            default: EmptyView()
            }
        }
        .animation(.spring(), value: phase)
        .onChange(of: phase) { newValue in
            if newValue == 10 {
                dismiss()
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("닫기")
                }

            }
        }
    }
}

struct SignUpManageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpManageView()
        }
    }
}
