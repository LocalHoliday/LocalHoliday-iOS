//
//  PagingRecommendationView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/01.
//

import SwiftUI

struct PagingRecommendationView: View {
    var images = [
        ImageView(id: 0, imageName: "Firefly"),
        ImageView(id: 1, imageName: "Firefly"),
        ImageView(id: 2, imageName: "Firefly")
    ]
    @State private var currentPage = 0
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottom) {
                    TabView(selection: $currentPage) {
                        ForEach(images, id: \.id) { imageView in
                            imageView
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    PageControl(numberOfPages: images.count, currentPage: $currentPage)
                        .padding(.bottom, 9)
                }
                .aspectRatio(1, contentMode: .fit)
            }
            .cornerRadius(Radius.Small)
            
            HStack {
                Text("반딧불이와 한께하는 무주에서의 로컬 홀리데이")
                    .font(.B3SB)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.top, Size.XS * 2)
            
            Text("전라북도 무주군")
                .font(.B4M)
                .padding(.top, Size.XS)
            
            Text("수박 재배  |  반딧불이 축제  |  글램핑")
                .font(.B4M)
                .padding(.top, Size.XS)
            
            Text("3박 4일")
                .font(.B4M)
                .padding(.top, Size.XXS)
                .foregroundColor(.tertiary)
        }
    }
}

struct PagingRecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        PagingRecommendationView()
    }
}

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
