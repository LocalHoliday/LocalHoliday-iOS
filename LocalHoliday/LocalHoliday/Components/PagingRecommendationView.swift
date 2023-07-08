//
//  PagingRecommendationView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/01.
//

import SwiftUI

struct PagingRecommendationView: View {
    @Binding var recommend: Recommend
    var images: [SquareImageView] { [
        SquareImageView(imageURL: recommend.imageURL),
        SquareImageView(imageURL: recommend.jobItem.imageURL),
        SquareImageView(imageURL: recommend.playItems.count == 0 ? nil : recommend.playItems[0].imageURL)
    ]}
    @State private var currentPage = 0
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottom) {
                    TabView(selection: $currentPage) {
                        ForEach(0..<3) { index in
                            images[index]
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
                Text(recommend.title)
                    .font(.B3SB)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.top, Size.XS * 2)
            
            Text(recommend.location)
                .font(.B4M)
                .padding(.top, Size.XS)
            
//            Text("수박 재배  |  반딧불이 축제  |  글램핑")
//                .font(.B4M)
//                .padding(.top, Size.XS)
//
//            Text("3박 4일")
//                .font(.B4M)
//                .padding(.top, Size.XXS)
//                .foregroundColor(.tertiary)
        }
    }
}

struct PagingRecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        PagingRecommendationView(recommend: .constant(.empty))
    }
}

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    var color: Color?
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        if let color {
            pageControl.currentPageIndicatorTintColor = UIColor(color)
            pageControl.pageIndicatorTintColor = UIColor(Color.gray100)
        }
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
