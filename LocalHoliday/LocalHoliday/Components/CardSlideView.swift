//
//  CardSlideView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/01.
//

import SwiftUI

struct CardSlideView: View {
    var images = [
        ImageView(id: 0, imageName: "image1"),
        ImageView(id: 1, imageName: "image2"),
        ImageView(id: 2, imageName: "image3")
    ]
    @State private var isScrapped = false
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
                .background(Color.gray100)
                
                Button {
                    isScrapped.toggle()
                } label: {
                    if !isScrapped {
                        Image(systemName: "star")
                            .renderingMode(.template)
                            .foregroundColor(.gray200)
                            .frame(width: Size.S, height: Size.S)
                            .padding()
                    } else {
                        Image(systemName: "star.fill")
                            .renderingMode(.original)
                            .frame(width: Size.S, height: Size.S)
                            .padding()
                    }
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
            }
            
            HStack {
                Spacer()
                Text("반딧불이와 한께하는 무주에서의 로컬 홀리데이")
                    .font(.B3SB)
                    .multilineTextAlignment(.center)
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
        .cornerRadius(Radius.Small)
    }
}

struct CardSlideView_Previews: PreviewProvider {
    static var previews: some View {
        CardSlideView()
    }
}

struct ImageView: View {
    var id: Int
    var imageName: String
    
    var body: some View {
        Image.Firefly
            .resizable()
            .aspectRatio(contentMode: .fit)
            .tag(id)
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
