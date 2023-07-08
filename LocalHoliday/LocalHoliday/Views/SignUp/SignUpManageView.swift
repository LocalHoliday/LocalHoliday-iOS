//
//  SignUpManageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUpManageView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authData: AuthData
    @State private var phase: Int = 0
    @State private var user: SignUpVO = .empty
    @State private var token: TokenResponseDTO?
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
            case 7: SignUp5View(password: $user.password, phase: $phase)
            case 8: SignUp6View(nickname: $user.nickname, phase: $phase)
            case 9: ProgressView()
            case 10: SignUpFinishView(nickname: $user.nickname, phase: $phase)
            case 11: EmptyView()
            default: ErrorView()
            }
        }
        .animation(.spring(), value: phase)
        .onChange(of: phase) { newValue in
            if newValue == 9 {
                authData.repository.signUp(user)
                    .prefix(1)
                    .sink { completion in
                        switch completion {
                        case .failure(let error):
                            print("error! : \(error.localizedDescription)")
                            phase += 999
                        case .finished:
                            print("finished!")
                        }
                    } receiveValue: { result in
                        print("result : \(result)")
                        token = result
                        phase += 1
                    }
                    .store(in: &authData.repository.cancellables)
            } else if newValue == 11 {
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
        .tapToHideKeyboard()
    }
}

struct SignUpManageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpManageView()
        }
    }
}
