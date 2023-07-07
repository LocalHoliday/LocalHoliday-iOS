//
//  OnboardingView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/07.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var phase: Int
    var images = [
        CircleImageView(image: Image.Onboarding1),
        CircleImageView(image: Image.Onboarding2),
        CircleImageView(image: Image.Onboarding3),
    ]
    var texts = [
        "여행 가려는 지역의 특색에 맞는\n로컬 알바를 구하고",
        "알바를 통해 번돈으로\n여행지의 놀거리를 즐길 수 있게 추천받으며",
        "다른 사람들의 후기를 보면서\n나한테 딱 맞는 로컬 홀리데이 일정 짜기까지"
    ]
    @State private var currentPage = 0
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                TabView(selection: $currentPage) {
                    ForEach(0..<3) { index in
                        images[index]
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Text(texts[currentPage])
                    .multilineTextAlignment(.center)
                    .font(.H4R)
                    .padding(.vertical, Size.Outer)
                    .animation(.spring(), value: currentPage)
                
                PageControl(numberOfPages: images.count, currentPage: $currentPage, color: .Primary)
                    .padding(.vertical, Size.Inner)
                
                
                RoundedRectangleButton(text: "회원가입 하기") {
                    phase += 1
                }
                .padding(Size.Inner)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(phase: .constant(0))
    }
}
