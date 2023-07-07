//
//  SplashView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/07.
//

import SwiftUI

struct SplashView: View {
    @Binding var phase: Int
    var body: some View {
        Image.LocalHoliday
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Size.Outer)
            .task {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    phase += 1
                }
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(phase: .constant(0))
    }
}
