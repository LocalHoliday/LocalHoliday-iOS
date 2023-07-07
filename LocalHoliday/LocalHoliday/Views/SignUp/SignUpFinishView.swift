//
//  SignUpFinishView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI

struct SignUpFinishView: View {
    @Binding var phase: Int
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Outer * 2) {
            Group {
                Text("반가워요 ")
                + Text("블랑사랑에디")
                    .foregroundColor(.Primary)
                + Text("님!")
            }
            .font(.H2SB)
            
            HStack {
                Spacer()
                CircleImageView(image: Image.Onboarding4)
                Spacer()
            }
            
            Spacer()
            
            RoundedRectangleButton(text: "로컬홀리데이 즐기러 가기") {
                phase += 1
            }
        }
        .padding(Size.Inner)
        .padding(.top, Size.Outer * 2)
    }
}

struct SignUpFinishView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFinishView(phase: .constant(0))
    }
}
